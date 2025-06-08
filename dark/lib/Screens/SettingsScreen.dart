import 'package:dark/Screens/favourite_page.dart';
import 'package:dark/Screens/home_page.dart';
import 'package:dark/Screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../darkMode_cubit/darkCubit.dart';
import '../darkMode_cubit/dark_states.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  String _selectedLanguage = 'English';
  // default language
  Widget build(BuildContext context) {
    return BlocListener<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is AppChangeModeState) {
          // Rebuild SettingsScreen when AppChangeModeState is emitted
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 32),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/profile .jpg'),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Notification',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.toggle_off_outlined,
                          size: 60,
                        ),

                        color: NewsCubit.get(context).isDark
                            ? const Color(0xFFFCC876)
                            : const Color(
                                0xFF115173), // اللون العادي في الوضع الفاتح
                      ),
                    ],
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Divider(
                      height: 1,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Dark Mode',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      BlocBuilder<NewsCubit, NewsStates>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              NewsCubit.get(context).changeAppMode();
                            },
                            icon: Icon(
                              NewsCubit.get(context).isDark
                                  ? Icons.toggle_on_outlined
                                  : Icons.toggle_off_outlined,
                              size: 60,
                              color: NewsCubit.get(context).isDark
                                  ? const Color(0xFFFCC876)
                                  : const Color(0xFF115173),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Divider(
                      height: 1,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Email Notification',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.toggle_off_outlined,
                          size: 60,
                        ),

                        color: NewsCubit.get(context).isDark
                            ? const Color(0xFFFCC876)
                            : const Color(
                                0xFF115173), // اللون العادي في الوضع الفاتح
                      ),
                    ],
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Divider(
                      height: 1,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Language',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Select Language'),
                                content: DropdownButton<String>(
                                  value: _selectedLanguage,
                                  items: <String>['English', 'Arabic']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Divider(
                      height: 1,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'About App',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Divider(
                      height: 1,
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Share App',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xFF222831),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFFFFC876),
            unselectedItemColor: const Color(0xFFD6E6F2),
            onTap: (index) {
              if (index == 0) {
                // Assuming Settings is at index 3
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
