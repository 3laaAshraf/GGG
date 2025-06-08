import 'package:dark/components/thank_you_card.dart';
import 'package:dark/darkMode_cubit/darkCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 25, right: 25, bottom: 50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2 + 15,
            left: 0,
            right: 0,
            child: Row(
              children: List.generate(
                40,
                (index) => Expanded(
                  child: Container(
                    color: const Color(0xFFB8B8B8),
                    margin: const EdgeInsets.all(2),
                    height: 5,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child: CircleAvatar(
              backgroundColor: NewsCubit.get(context).isDark
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child: CircleAvatar(
              backgroundColor: NewsCubit.get(context).isDark
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Colors.white,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xFFD9D9D9),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: const Color(0xFF34A853),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
