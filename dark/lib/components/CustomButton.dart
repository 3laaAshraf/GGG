import 'package:flutter/material.dart';

import '../darkMode_cubit/darkCubit.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed; // تعريف onPressed كدالة اختيارية

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      width: double.infinity,
      height: 50,
      child: MaterialButton(
        onPressed: onPressed, // استدعاء الدالة مباشرة لأنها اختيارية
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        color: NewsCubit.get(context).isDark
            ? const Color(0xFFFCC876)
            : const Color(0xFF115173),
      ),
    );
  }
}
