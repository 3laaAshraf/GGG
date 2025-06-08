import 'package:flutter/material.dart';
import '../darkMode_cubit/darkCubit.dart';

class Textformfield extends StatelessWidget {
  const Textformfield({
    required this.HintText,
    this.obscureText = false,
    required this.textInputType,
    this.controller,
    this.icon,
    this.validator,
  });

  final String HintText;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final Widget? icon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    bool isDark = NewsCubit.get(context).isDark;

    return TextFormField(
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
      ),
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: HintText,
        hintStyle: TextStyle(
          color: isDark ? Colors.white70 : Colors.black54,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isDark ? Colors.white : Colors.black87, // أكثر وضوحًا
            width: 1.5, // زيادة سمك الحواف قليلاً
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isDark
                ? Colors.white70
                : Colors.black54, // أوضح عند عدم التركيز
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: isDark ? Colors.white : Colors.black, // أقوى عند التركيز
            width: 2, // سمك أكبر عند التركيز
          ),
        ),
      ),
      validator: validator,
    );
  }
}
