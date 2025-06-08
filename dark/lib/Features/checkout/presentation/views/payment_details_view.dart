import 'package:dark/components/Payments_details_view_body.dart';
import 'package:dark/darkMode_cubit/darkCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PayementsDetailsView extends StatelessWidget {
  const PayementsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/arrow.svg",
            height: 23,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Payment Details',
            style: TextStyle(
              color: NewsCubit.get(context).isDark
                  ? const Color.fromARGB(255, 170, 167, 240)
                  : Color.fromARGB(255, 18, 6, 46),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PaymentsDetailsViewBody(),
    );
  }
}
