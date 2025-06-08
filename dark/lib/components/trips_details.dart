import 'package:dark/Screens/Payment.dart';
import 'package:dark/Screens/booking_page.dart';
import 'package:dark/Screens/reviews_page.dart';
import 'package:dark/components/CustomButton.dart';
import 'package:dark/components/payment_method_item.dart';
import 'package:dark/models/places_and_trips.dart';
import 'package:flutter/material.dart';
import '../darkMode_cubit/darkCubit.dart';

class TripsDetails extends StatelessWidget {
  const TripsDetails({super.key, required this.places});
  final Places places;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: NewsCubit.get(context).isDark
          ? const Color(0xFF222831)
          : Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(places.imageUrl),
                        ),
                      ),
                    ),

                    // Title Section
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 16.0,
                      ),
                      child: Text(
                        places.title,
                        style: TextStyle(
                          color: NewsCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Instant Confirmation Row
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bolt,
                            size: 16,
                            color: Color(0xffffc876),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Instant Confirmation',
                            style: TextStyle(
                              color: NewsCubit.get(context).isDark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Location Image
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/location.jpg'),
                          ),
                        ),
                      ),
                    ),

                    // Package Options
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Package Options',
                            style: TextStyle(
                              color: NewsCubit.get(context).isDark
                                  ? const Color(0xFFFCC876)
                                  : const Color(0xFF115173),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            places.description,
                            style: TextStyle(
                              color: NewsCubit.get(context).isDark
                                  ? Colors.white
                                  : const Color.fromARGB(255, 49, 119, 143),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Inclusive Of
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Inclusive of',
                            style: TextStyle(
                              color: NewsCubit.get(context).isDark
                                  ? const Color(0xFFFCC876)
                                  : const Color(0xFF115173),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            places.included,
                            style: TextStyle(
                              color: NewsCubit.get(context).isDark
                                  ? Colors.white
                                  : const Color.fromARGB(255, 49, 119, 143),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Itinerary
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Itinerary',
                            style: TextStyle(
                              color: NewsCubit.get(context).isDark
                                  ? const Color(0xFFFCC876)
                                  : const Color(0xFF115173),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            places.itinerary,
                            style: TextStyle(
                              color: NewsCubit.get(context).isDark
                                  ? Colors.white
                                  : const Color.fromARGB(255, 49, 119, 143),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return ReviewsPage(
                                    type: "trips",
                                    docTitle: places.title,
                                    ratings: places.rating,
                                  );
                                }));
                              },
                              child: const Text(
                                "Reviews",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffffc876),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),

          // Bottom Bar
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: NewsCubit.get(context).isDark
                  ? const Color(0xff222831)
                  : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border: Border(top: BorderSide(color: Color(0xffffc876))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  places.price,
                  style: TextStyle(
                    color: NewsCubit.get(context).isDark
                        ? const Color(0xFFFCC876)
                        : const Color(0xFF115173),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (BuildContext context) {
                    //   return BookingScreen();
                    // }));
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: NewsCubit.get(context).isDark
                            ? const Color(0xFF222831)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        builder: (context) {
                          return PaymentMethodBottomSheet();
                        });
                  },
                  child: Container(
                    width: screenWidth * 0.4,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xffffc876),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: const Center(
                      child: Text(
                        'Check Availability',
                        style: TextStyle(
                          color: Color(0xff222831),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentMethodBottomSheet extends StatefulWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  State<PaymentMethodBottomSheet> createState() =>
      _PaymentMethodBottomSheetState();
}

class _PaymentMethodBottomSheetState extends State<PaymentMethodBottomSheet> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeIndex = 0;
                  });
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
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: NewsCubit.get(context).isDark
                  ? const Color(0xFFffc876)
                  : const Color(0xFF222831),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Custombutton(
              text: 'Continue',
            ),
          ),
        ],
      ),
    );
  }
}
