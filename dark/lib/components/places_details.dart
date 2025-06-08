import 'package:dark/Screens/Payment.dart';
import 'package:dark/Screens/booking_page.dart';
import 'package:dark/Screens/reviews_page.dart';
import 'package:dark/models/places_and_trips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../darkMode_cubit/darkCubit.dart';

class PlacesDetails extends StatelessWidget {
  const PlacesDetails({super.key, required this.places});
  final Places places;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          places.title,
          style: TextStyle(
            color: NewsCubit.get(context).isDark
                ? const Color(0xFFFCC876)
                : const Color(0xFF115173),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/arrow.svg",
            height: 23,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                                    type: "places",
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return BookingScreen();
                    }));
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
