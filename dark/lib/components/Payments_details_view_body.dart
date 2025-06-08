import 'dart:developer';

import 'package:dark/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:dark/components/custom_credit_card.dart';
import 'package:dark/components/payment_method_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentsDetailsViewBody extends StatefulWidget {
  const PaymentsDetailsViewBody({super.key});

  @override
  State<PaymentsDetailsViewBody> createState() =>
      _PaymentsDetailsViewBodyState();
}

class _PaymentsDetailsViewBodyState extends State<PaymentsDetailsViewBody> {
  int activeIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  activeIndex = 0;
                  setState(() {});
                },
                child: PaymentsMethodItem(
                  isActive: activeIndex == 0,
                  imagePath: "assets/Group.svg",
                  isSVG: true,
                ),
              ),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  activeIndex = 1;
                  setState(() {});
                },
                child: PaymentsMethodItem(
                  isActive: activeIndex == 1,
                  imagePath: "assets/Visa-Logo-2006.png",
                  isSVG: false,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
            child: CustomCreditCard(
          autovalidateMode: autovalidateMode,
          formKey: formKey,
        )),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('PAYMENT SUCCESSFUL');
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ThankYouView();
                      },
                    ));
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Text('Pay',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        width: double.infinity,
        height: 70,
        decoration: ShapeDecoration(
          color: const Color.fromARGB(255, 13, 5, 57),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
