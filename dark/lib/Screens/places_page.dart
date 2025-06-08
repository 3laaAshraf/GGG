import 'package:dark/Screens/home_page.dart';
import 'package:dark/Services/fetch_data_service.dart';
import 'package:dark/components/place_item.dart';
import 'package:dark/darkMode_cubit/darkCubit.dart';
import 'package:dark/models/places_and_trips.dart';
import 'package:flutter/material.dart';

class PlacesPage extends StatefulWidget {
  PlacesPage({super.key});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  late List<Places> items = [];

  @override
  void initState() {
    super.initState();
    // Initialize the data fetching when the widget is created
    FetchData().getPlaces().then((res) {
      setState(() {
        items = res;
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
            padding: const EdgeInsets.only(right: 8, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    iconSize: 28,
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
                          : const Color(
                              0xFF115173), // اللون العادي في الوضع الفاتح
                    )),
                Text(
                  'Places to visit',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: NewsCubit.get(context).isDark
                        ? const Color(0xFFFCC876)
                        : const Color(0xFF115173),
                  ),
                ),
                IconButton(
                  iconSize: 28,
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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return PlaceItem(
                    places: items[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
