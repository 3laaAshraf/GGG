import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/TextFormField.dart';
import '../darkMode_cubit/darkCubit.dart';
class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // دالة لإرسال رابط إعادة تعيين كلمة المرور
  void _resetPassword() async {
    try {
      String email = _emailController.text;

      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter your email address')),
        );
        return;
      }

      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset link has been sent to your email')),
      );
      
      Navigator.pop(context);  // العودة لصفحة تسجيل الدخول
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send reset link. Please try again later')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your email to reset your password',
              style: TextStyle(fontSize: 22,
              color: NewsCubit.get(context).isDark
                        ? const Color(
                            0xFFCCCCCC) // لون رمادي فاتح في الوضع المظلم
                        : const Color(0xFF333333),
              ),
            ),
            SizedBox(height: 20),
            // TextField(
            //   controller: _emailController,
            //   decoration: InputDecoration(
            //     labelText: 'Email',
            //     border: OutlineInputBorder(),
            //   ),
            // ),

          Textformfield(
                HintText: 'Email',
                textInputType: TextInputType.emailAddress,
                controller: _emailController,
              ),
             
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text('Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}







