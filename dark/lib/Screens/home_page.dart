import 'package:dark/Screens/SettingsScreen.dart';
import 'package:dark/Screens/favourite_page.dart';
import 'package:dark/Screens/notification_page.dart';
import 'package:dark/Screens/places_page.dart';
import 'package:dark/Screens/profile_page.dart';
import 'package:dark/Screens/trips_page.dart';
import 'package:dark/chatbot/chatbot_page.dart';
import 'package:flutter/material.dart';
import '../darkMode_cubit/darkCubit.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NewsCubit.get(context).isDark
            ? const Color(0xFF222831)
            : Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/profile .jpg'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                        color: NewsCubit.get(context).isDark
                            ? Color(0xFFD6E6F2)
                            : Color(0xFF115173),
                        fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Alice',
                    style: TextStyle(
                        color: NewsCubit.get(context).isDark
                            ? Color(0xFFD6E6F2)
                            : Color(0xFF115173),
                        fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                iconSize: 35,
                icon: const Icon(Icons.notifications, color: Color(0xFF115173)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()));
                },
              ),
              Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: NewsCubit.get(context).isDark
          ? const Color(0xFF222831)
          : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFD6E6F2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Color(0xFF222831),
                      size: 30,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return PlacesPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF115173),
                        foregroundColor: const Color(0xFFD6E6F2),
                        // primary: Color(0xFF115173),
                        // onPrimary: Color(0xFFD6E6F2),
                      ),
                      child: const Text(
                        'Places',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return TripsPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF115173),
                        foregroundColor: const Color(0xFFD6E6F2),
                      ),
                      child: const Text(
                        'Trips',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // الأماكن الموصى بها (Recommended Places)
              const Text(
                'Recommended Places',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC876)),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 140,
                child: PageView(
                  controller: PageController(viewportFraction: 1.0),
                  children: const [
                    SpecialOfferCard(
                      imageUrl:
                          'assets/new egyptian.jpg', // صورة محلية من الجهاز
                      placeName: 'Egyptian museum',
                    ),
                    SpecialOfferCard(
                      imageUrl: 'assets/sea.jpg', // صورة محلية
                      placeName: ' Red Sea',
                    ),
                    SpecialOfferCard(
                      imageUrl: 'assets/pyramids.jpg',
                      placeName: 'Pyramids',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // الرحلات الشعبية (Popular Trips)
              const Text(
                'Popular Trips',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFC876)),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 140,
                child: PageView(
                  controller: PageController(viewportFraction: 1.0),
                  children: const [
                    SpecialOfferCard(
                      imageUrl: 'assets/air ballon.jpg', // صورة محلية من الجهاز
                      placeName: 'Air balloon',
                    ),
                    SpecialOfferCard(
                      imageUrl: 'assets/Al-Muizz Street.jpg', // صورة محلية
                      placeName: 'Al-Muizz Street',
                    ),
                    SpecialOfferCard(
                      imageUrl: 'assets/Elkarnak temple.jpg',
                      placeName: 'Elkarnak temple',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 55,
        width: 55,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => chatBot(),
              ), // Navigate to ChatbotScreen
            );
          },
          backgroundColor: const Color.fromARGB(255, 35, 139, 196),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/4712/4712109.png',
            fit: BoxFit.cover,
          ),
        ),
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
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SavedScreen()));
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

// مكون العروض الخاصة (SpecialOfferCard)
class SpecialOfferCard extends StatefulWidget {
  final String imageUrl;
  final String placeName;

  const SpecialOfferCard(
      {super.key, required this.imageUrl, required this.placeName});

  @override
  _SpecialOfferCardState createState() => _SpecialOfferCardState();
}

class _SpecialOfferCardState extends State<SpecialOfferCard> {
  bool isFavorite = false; // حالة القلب

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(widget.imageUrl), // جلب الصورة من الجهاز المحلي
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black.withOpacity(0.5),
              child: Text(
                widget.placeName,
                style: const TextStyle(color: Color(0xFFD6E6F2)),
              ),
            ),
          ),
        ),
        // أيقونة القلب في الزاوية اليمنى العلوية
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // تغيير حالة القلب عند الضغط
              });
            },
          ),
        ),
      ],
    );
  }
}
