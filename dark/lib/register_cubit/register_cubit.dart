// register_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  // Constructor
  RegisterCubit(this._auth, this._firestore) : super(RegisterInitial());

  // Visibility toggles for password fields
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityToggled(isPasswordVisible));
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(PasswordVisibilityToggled(isConfirmPasswordVisible));
  }

  // User registration method
  Future<void> registerUser({
    required String email,
    required String password,
    required String phoneNumber,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoading());

    // Validate input fields
    if (email.isEmpty ||
        password.isEmpty ||
        phoneNumber.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty) {
      emit(RegisterFailure('All fields are required.'));
      return;
    }

    try {
      // Check if the email is already in use in Firebase
      final signInMethods = await _auth.fetchSignInMethodsForEmail(email);
      if (signInMethods.isNotEmpty) {
        // If email exists, send password reset link
        await _auth.sendPasswordResetEmail(email: email);
        emit(RegisterFailure(
            'This email is already in use. A password reset link has been sent.'));
        return;
      }

      // If email is not registered, create a new user
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user data in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'phoneNumber': phoneNumber,
        'firstName': firstName,
        'lastName': lastName,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Send email verification after registration
      await userCredential.user!.sendEmailVerification();

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already in use.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
          break;
        default:
          errorMessage = 'An unexpected error occurred. Please try again.';
      }
      emit(RegisterFailure(errorMessage));
    } catch (e) {
      // Handle general errors
      emit(RegisterFailure('Failed to register. Please try again later.'));
    }
  }
}
