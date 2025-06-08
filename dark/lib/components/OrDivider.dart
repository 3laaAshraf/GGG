import 'package:flutter/material.dart';

import '../darkMode_cubit/darkCubit.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 0.5,
              color: NewsCubit.get(context).isDark
                  ?   const Color(0xFFFCC876)
                  : const Color(0xFF115173), // لون الخط الفاصل
            ),
          ),
          const SizedBox(width: 10,),
          const Text(
            ' or ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
         const SizedBox(width: 10,),
          Expanded(
            child: Container(
              height: 0.5,
              color: NewsCubit.get(context).isDark
                  ?   const Color(0xFFFCC876)
                  : const Color(0xFF115173), // لون الخط الفاصل
            ),
          ),
        ],
      ),
    );
  }
}