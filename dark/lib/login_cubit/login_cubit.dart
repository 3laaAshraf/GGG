import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth;
  int attempts = 0;
  bool _isLoading = false;
  String? _currentErrorMessage;

  LoginCubit(this._auth) : super(LoginInitial());

  static LoginCubit get(BuildContext context) =>
      BlocProvider.of<LoginCubit>(context);

  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(LoginLoading());
    _currentErrorMessage = null;

    try {
      // 1. Empty Field Check
      if (email.isEmpty || password.isEmpty) {
        _isLoading = false;
        _currentErrorMessage = "Please enter both email and password.";
        emit(LoginFailure(_currentErrorMessage!));
        return;
      }

      // 2. Attempts Limit Check
      if (attempts >= 3) {
        _isLoading = false;
        _currentErrorMessage = "Maximum login attempts reached.";
        emit(LoginFailure(_currentErrorMessage!));
        return;
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      // 3. Email Verification Check
      if (user != null && !user.emailVerified) {
        _isLoading = false;
        _currentErrorMessage = "Email not verified. Please check your inbox.";
        emit(LoginFailure(_currentErrorMessage!));

        // عرض SnackBar للتحقق من البريد الإلكتروني مع الأزرار
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Your email is not verified!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    await user.sendEmailVerification();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Verification email sent! Check your inbox.'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  },
                  child: const Text('Resend Verification Email'),
                ),
              ],
            ),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 5),
          ),
        );
        return;
      }

      // 4. Login Success
      _isLoading = false;
      attempts = 0;
      emit(LoginSuccess());
      // No navigation here, do it in the UI
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      attempts++;
      print("===========");
      print(e.code);
      print("===========");

      if (e.code == 'invalid-credential') {
        _currentErrorMessage = "Wrong email or password";
      } else {
        _currentErrorMessage = "Login failed. Please try again.";
        print('Login Error: ${e.code} - $_currentErrorMessage');
      }

      emit(LoginFailure(_currentErrorMessage!));
    } catch (e) {
      _isLoading = false;
      _currentErrorMessage = "Unexpected error occurred.";
      emit(LoginFailure(_currentErrorMessage!));
      print('Unexpected Error: $e');
    }
  }
}
