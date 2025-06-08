import 'package:dark/Screens/Payment.dart';
import 'package:dark/darkMode_cubit/darkCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate = DateTime(2024, 10, 1);
  int persons = 5;
  double pricePerPerson = 598.27;

  @override
  Widget build(BuildContext context) {
    double totalPrice = persons * pricePerPerson;

    // Define Background Color
    // Color backgroundColor = const Color(0xFF115173);
    Color oppositeColor =
        Colors.white; // You can adjust this for better contrast

    return Scaffold(
      backgroundColor: NewsCubit.get(context).isDark
          ? const Color(0xFF222831)
          : Colors.white,
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
          title: const Text("Explore Jazan City")),
      body: Container(
        color: NewsCubit.get(context).isDark
            ? const Color(0xFF222831)
            : Colors.white, // Set background color
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text("October 2024",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 10),

                // Apply Theme to Calendar
                Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: NewsCubit.get(context).isDark
                          ? Colors.white
                          : Color(
                              0xFF222831), // Highlight color (selected date, active buttons)
                      onPrimary: NewsCubit.get(context).isDark
                          ? const Color(0xFF222831)
                          : Colors.white, // Text on the selected date
                      surface: NewsCubit.get(context).isDark
                          ? Colors.white
                          : Color(0xFF222831), // Calendar background color
                      onSurface: NewsCubit.get(context).isDark
                          ? Colors.white
                          : Color(0xFF222831), // Calendar text color
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: NewsCubit.get(context).isDark
                            ? const Color(0xFF222831)
                            : Colors.white, // Text color for buttons
                      ),
                    ),
                  ),
                  child: CalendarDatePicker(
                    initialDate: selectedDate,
                    firstDate: DateTime(2024, 10, 1),
                    lastDate: DateTime(2027, 10, 31),
                    onDateChanged: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 20),
                Text(
                    "Selected Date: ${selectedDate.toLocal().toString().split(' ')[0]}",
                    style: TextStyle(
                      fontSize: 18,
                      color: NewsCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black,
                    )),
                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("09:00 AM",
                        style: TextStyle(
                          fontSize: 18,
                          color: NewsCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black,
                        )),
                    Row(
                      children: [
                        IconButton(
                          onPressed: persons > 4
                              ? () {
                                  setState(() {
                                    persons--;
                                  });
                                }
                              : null,
                          icon: Icon(
                            Icons.remove,
                            color: NewsCubit.get(context).isDark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Text("$persons",
                            style: TextStyle(
                              fontSize: 16,
                              color: NewsCubit.get(context).isDark
                                  ? Colors.white
                                  : Colors.black,
                            )),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              persons++;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: NewsCubit.get(context).isDark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                SizedBox(height: 20),
                Text("Total Price: SAR ${totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: NewsCubit.get(context).isDark
                          ? Colors.white
                          : Colors.black,
                    )),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Payment()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF115173),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text("Continue",
                        style: TextStyle(fontSize: 22, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
