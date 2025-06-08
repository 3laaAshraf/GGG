import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../darkMode_cubit/darkCubit.dart';

class CountryCodePicker extends StatefulWidget {
  final TextEditingController phoneNumberController;

  CountryCodePicker({required this.phoneNumberController, Key? key})
      : super(key: key);

  @override
  _CountryCodePickerState createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  String selectedCountryCode = '+20'; // الكود الافتراضي لمصر
  String selectedCountryFlag = '🇪🇬'; // العلم الافتراضي لمصر
  List<Map<String, String>> countries = [
    {'name': 'Egypt', 'code': '+20', 'flag': '🇪🇬'},
    {'name': 'Saudi Arabia', 'code': '+966', 'flag': '🇸🇦'},
    {'name': 'United Arab Emirates', 'code': '+971', 'flag': '🇦🇪'},
    {'name': 'United States', 'code': '+1', 'flag': '🇺🇸'},
    {'name': 'United Kingdom', 'code': '+44', 'flag': '🇬🇧'},
    {'name': 'Germany', 'code': '+49', 'flag': '🇩🇪'},
    {'name': 'France', 'code': '+33', 'flag': '🇫🇷'},
    {'name': 'India', 'code': '+91', 'flag': '🇮🇳'},
  ];

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.phoneNumberController,
      keyboardType: TextInputType.phone,
      style: TextStyle(
        color: NewsCubit.get(context).isDark ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        hintText: 'Phone Number',
        hintStyle: TextStyle(
          color:
              NewsCubit.get(context).isDark ? Colors.white70 : Colors.black54,
        ),
        prefixIcon: GestureDetector(
          onTap: () {
            showCountryCodePicker(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedCountryFlag,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 6),
                Text(
                  selectedCountryCode,
                  style: TextStyle(
                    color: NewsCubit.get(context).isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        //  تحديد لون الخلفية هنا
        fillColor: NewsCubit.get(context).isDark
            ? const Color.fromARGB(6, 0, 0, 0) // لون داكن للوضع المظلم
            : Colors.grey[200], // لون فاتح للوضع العادي

        filled: true,
        // استخدام OutlineInputBorder مباشرة مع enabledBorder و focusedBorder
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: NewsCubit.get(context).isDark
                ? Colors.white // أبيض للوضع المظلم
                : Colors.blue, // أزرق للوضع العادي
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: NewsCubit.get(context).isDark
                ? Colors.white // أبيض للوضع المظلم
                : Colors.blue, // أزرق للوضع العادي
            width: 2.0,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a phone number';
        }
        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
          return 'Please enter a valid phone number';
        }
        if (!value.startsWith(selectedCountryCode)) {
          return 'Phone number must start with the selected country code';
        }
        return null;
      },
    );
  }

  void showCountryCodePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Country'),
          content: Container(
            height: 300,
            width: double.maxFinite,
            child: ListView(
              children: countries.map((country) {
                final String? flag = country['flag'];
                final String? code = country['code'];

                if (flag == null || code == null) {
                  return Container();
                }

                return ListTile(
                  leading: Text(
                    flag,
                    style: TextStyle(fontSize: 24),
                  ),
                  title: Text('${country['name']} ($code)'),
                  onTap: () {
                    setState(() {
                      selectedCountryCode = code!;
                      selectedCountryFlag = flag!;
                      widget.phoneNumberController.text = selectedCountryCode +
                          widget.phoneNumberController.text
                              .replaceFirst(RegExp(r'^\+?\d+'), '');
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
