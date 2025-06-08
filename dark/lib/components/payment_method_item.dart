import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentsMethodItem extends StatelessWidget {
  const PaymentsMethodItem(
      {super.key, this.isActive = false, this.imagePath, this.isSVG = false});
  final bool isActive;
  final String? imagePath;
  final bool isSVG;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 115,
      height: 65,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isActive
                ? Color.fromARGB(255, 14, 225, 70)
                : Colors.transparent,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive
                ? Color.fromARGB(255, 14, 225, 70)
                : Colors.transparent,
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 210, 235, 255),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Center(
          child: isSVG
              ? SvgPicture.asset(
                  imagePath ?? "assets/Group.svg",
                  height: 24,
                )
              : Image.asset("assets/Visa-Logo-2006.png", height: 55, width: 70),
        ),
      ),
    );
  }
}
