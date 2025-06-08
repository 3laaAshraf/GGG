import 'package:dark/Screens/SettingsScreen.dart';
import 'package:dark/Screens/home_page.dart';
import 'package:dark/Screens/profile_page.dart';
import 'package:dark/components/place_item.dart';
import 'package:dark/darkMode_cubit/darkCubit.dart';
import 'package:dark/models/places_and_trips.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final List<Places> loved_places = const [
    Places(
      imageUrl: 'Assets/abo simple.jpg',
      title: 'Abu Simbel Temple\n',
      price: '200 EGB',
      rating: [],
      description: 'Abo Simpel Temple Half Day Tour',
      included:
          'Admission to: Abo Simpel Temple\nProfessional guide\nRound trip transfers to and from your hotel',
      itinerary: '09:00 AM Pick-up time\ntemple visit\n03:00 PM Return time',
    ),
  ];
  final List<Places> loved_trips = const [
    Places(
        imageUrl: 'Assets/Sharm El Sheikh.jpg',
        title: 'Sharm El Sheikh \n 3 Nights',
        price: '1200 \$',
        rating: [],
        description: '',
        included: '',
        itinerary: ''),
    Places(
        imageUrl: 'Assets/Luxor.jpg',
        title: 'Luxor Tour \n 1 day',
        price: '300 \$',
        rating: [],
        description: '',
        included: '',
        itinerary: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewsCubit.get(context).isDark
          ? const Color(0xFF222831)
          : Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF222831),
        title: Center(
          child: Text("Favourites",
              style: TextStyle(color: Color.fromARGB(255, 248, 249, 248))),
        ),
        actions: [
          IconButton(
              color: Colors.white, icon: Icon(Icons.search), onPressed: () {})
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "Places",
            ),
            Tab(text: "Trips"),
          ],
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xFF115173),
          labelStyle: TextStyle(
            fontSize: 25, // Adjust the font size here
            fontWeight: FontWeight.bold, // Optional, for bold text
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: loved_places.length,
                itemBuilder: (context, index) {
                  return PlaceItem(places: loved_places[index]);
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: loved_trips.length,
                itemBuilder: (context, index) {
                  return PlaceItem(places: loved_trips[index]);
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF222831),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFFC876),
        unselectedItemColor: const Color(0xFFD6E6F2),
        onTap: (index) {
          if (index == 3) {
            // Assuming Settings is at index 3
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsScreen()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          } else if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
