import 'package:dark/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/country_code.dart';
import '../darkMode_cubit/darkCubit.dart';
import '../register_cubit/register_cubit.dart';
import 'Login.dart';
import '../components/CustomButton.dart';
import '../components/TextFormField.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  bool loading = true;

  void initState() {
    super.initState();
    _checkIfUserIsLoggedIn().then((res) {
      loading = false;
      setState(() {});
    });
  }

  Future<void> _checkIfUserIsLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;

    // If user is signed in, navigate to the home screen
    if (user != null) {
      // Delay to simulate loading screen
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        FirebaseAuth.instance,
        FirebaseFirestore.instance,
      ),
      child: SafeArea(
        child: Scaffold(
          body: loading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.blue,
                ))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Image.asset('assets/travel.webp'),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'JetSetGo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Welcome! Create your new account!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Textformfield(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email required';
                            }
                            if (!RegExp(
                                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          HintText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          controller: emailController,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: Textformfield(
                                HintText: 'First Name',
                                textInputType: TextInputType.text,
                                controller: firstNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First Name required';
                                  }
                                  if (value.length < 2) {
                                    return 'First Name must be at least contain 2 characters';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Textformfield(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name required';
                                  }
                                  if (value.length < 2) {
                                    return 'Last Name must be at least contain 2 characters';
                                  }
                                  return null;
                                },
                                HintText: 'Last Name',
                                textInputType: TextInputType.text,
                                controller: lastNameController,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        CountryCodePicker(
                          phoneNumberController: phoneNumberController,
                        ),
                        const SizedBox(height: 25),
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            final cubit = context.read<RegisterCubit>();
                            return Textformfield(
                              HintText: 'Password',
                              textInputType: TextInputType.text,
                              controller: passwordController,
                              obscureText: !cubit.isPasswordVisible,
                              icon: IconButton(
                                color: NewsCubit.get(context).isDark
                                    ? Colors.white
                                    : Colors.black,
                                onPressed: cubit.togglePasswordVisibility,
                                icon: Icon(
                                  cubit.isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 25),
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            final cubit = context.read<RegisterCubit>();
                            return Textformfield(
                              HintText: 'Confirm Password',
                              textInputType: TextInputType.text,
                              controller: confirmPasswordController,
                              obscureText: !cubit.isConfirmPasswordVisible,
                              icon: IconButton(
                                color: NewsCubit.get(context).isDark
                                    ? Colors.white
                                    : Colors.black,
                                onPressed:
                                    cubit.toggleConfirmPasswordVisibility,
                                icon: Icon(
                                  cubit.isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: Colors.grey, // Use a consistent color
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: NewsCubit.get(context).isDark
                                        ? const Color(0xFFFCC876)
                                        : const Color(0xFF115173),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        BlocConsumer<RegisterCubit, RegisterState>(
                          listener: (context, state) {
                            if (state is RegisterSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Registration successful!'),
                                ),
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            } else if (state is RegisterFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.errorMessage),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is RegisterLoading) {
                              return const CircularProgressIndicator();
                            }

                            return Custombutton(
                              text: 'Register',
                              onPressed: () {
                                final cubit =
                                    BlocProvider.of<RegisterCubit>(context);
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Passwords do not match'),
                                    ),
                                  );
                                  return;
                                }
                                cubit.registerUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phoneNumber: phoneNumberController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
