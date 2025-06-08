import 'package:dark/Screens/home_page.dart';
import 'package:dark/components/place_item.dart';
import 'package:dark/components/trip_item.dart';
import 'package:dark/models/places_and_trips.dart';
import 'package:flutter/material.dart';
import '../Services/fetch_data_service.dart';
import '../darkMode_cubit/darkCubit.dart';

class TripsPage extends StatefulWidget {
  TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  late List<Places> trips = [];

  @override
  void initState() {
    super.initState();
    // جلب البيانات من فايربيز
    FetchData().getTrips().then((res) {
      setState(() {
        trips = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewsCubit.get(context).isDark
          ? const Color(0xFF222831)
          : Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return HomePage();
                      }));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: NewsCubit.get(context).isDark
                          ? const Color(0xFFFCC876)
                          : const Color(0xFF115173),
                    )),
                Text(
                  'Packages',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: NewsCubit.get(context).isDark
                        ? const Color(0xFFFCC876)
                        : const Color(0xFF115173),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: NewsCubit.get(context).isDark
                        ? const Color(0xFFFCC876)
                        : const Color(0xFF115173),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  return TripItem(places: trips[index]);
                }),
          )
        ],
      ),
    );
  }
}
