import 'package:dark/darkMode_cubit/darkCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autovalidateMode});

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (value) {},
        ),
        Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: NewsCubit.get(context).isDark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: NewsCubit.get(context).isDark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: NewsCubit.get(context).isDark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: NewsCubit.get(context).isDark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              labelStyle: TextStyle(
                color:
                    NewsCubit.get(context).isDark ? Colors.white : Colors.black,
              ),
              hintStyle: TextStyle(
                color:
                    NewsCubit.get(context).isDark ? Colors.white : Colors.black,
              ),
              errorStyle: TextStyle(
                color: NewsCubit.get(context).isDark ? Colors.blue : Colors.red,
              ),
            ),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary:
                  NewsCubit.get(context).isDark ? Colors.white : Colors.black,
            ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                color:
                    NewsCubit.get(context).isDark ? Colors.white : Colors.black,
              ),
              bodyMedium: TextStyle(
                color:
                    NewsCubit.get(context).isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          child: CreditCardForm(
            autovalidateMode: widget.autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (CreditCardModel) {
              cardHolderName = CreditCardModel.cardHolderName;
              cardNumber = CreditCardModel.cardNumber;
              expiryDate = CreditCardModel.expiryDate;
              cvvCode = CreditCardModel.cvvCode;
              showBackView = CreditCardModel.isCvvFocused;
              setState(() {});
            },
            formKey: widget.formKey,
          ),
        ),
      ],
    );
  }
}
