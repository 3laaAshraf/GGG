import 'package:dark/Screens/Login.dart';
import 'package:dark/Screens/Payment.dart';
import 'package:dark/Screens/SettingsScreen.dart';
import 'package:dark/Screens/check_list.dart';
import 'package:dark/Screens/edit_profile.dart';
import 'package:dark/Screens/favourite_page.dart';
import 'package:dark/Screens/home_page.dart';
import 'package:dark/chatbot/chatbot_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../darkMode_cubit/darkCubit.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NewsCubit.get(context).isDark
            ? const Color(0xFF222831)
            : Colors.white, // نفس لون AppBar السابق
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: NewsCubit.get(context).isDark
                ? const Color(0xFFEEEEEE)
                : const Color(0xFF115173),
          ), // لون النص نفس السابق
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: NewsCubit.get(context).isDark
                ? const Color(0xFFEEEEEE)
                : const Color(0xFF115173),
          ), // أيقونة الرجوع بلون النص
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: NewsCubit.get(context).isDark
          ? const Color(0xFF222831)
          : Colors.white, // نفس خلفية الصفحة السابقة
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // صورة البروفايل
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/profile .jpg'), // صورة البروفايل
            ),
            const SizedBox(height: 10),
            // اسم المستخدم
            Text(
              'Hatem-Mohsen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: NewsCubit.get(context).isDark
                    ? const Color(0xFFEEEEEE)
                    : const Color(0xFF115173),
              ), // اللون الأبيض للنص
            ),
            const SizedBox(height: 5),
            // البريد الإلكتروني
            Text(
              'hatemmo2001@gmail.com',
              style: TextStyle(
                  fontSize: 14, color: Colors.grey[400]), // لون رمادي خفيف
            ),
            const SizedBox(height: 20),
            // قائمة الخيارات
            Expanded(
              child: ListView(
                children: [
                  ProfileListItem(
                    icon: Icons.edit,
                    text: 'Edit Profile',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Edit_Profile()));
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.payment,
                    text: 'Payment',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Payment()));
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.notifications,
                    text: 'Notifications',
                    onTap: () {},
                  ),
                  ProfileListItem(
                    icon: Icons.security,
                    text: 'Security',
                    onTap: () {},
                  ),
                  ProfileListItem(
                    icon: Icons.smart_toy, // أيقونة الروبوت من مكتبة فلاتر
                    text: 'Chat bot',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => chatBot()));
                    },
                  ),
                  ProfileListItem(
                    icon:
                        Icons.list_alt_rounded, // أيقونة الروبوت من مكتبة فلاتر
                    text: 'Travel CheckList',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const CheckList();
                      }));
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.help_outline,
                    text: 'Help & Support',
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  ProfileListItem(
                    icon: Icons.logout,
                    text: 'Log Out',
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Login()), // استبدلي HomeScreen بالصفحة اللي تريديها
                      );
                    },
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
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
          } else if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
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

class ProfileListItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const ProfileListItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: NewsCubit.get(context).isDark
            ? const Color(0xFFEEEEEE)
            : const Color(0xFF115173),
      ), // الأيقونات بنفس لون العناصر غير النشطة
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: NewsCubit.get(context).isDark
              ? const Color(0xFFEEEEEE)
              : const Color(
                  0xFF115173), // لون النصوص بنفس لون العناصر غير النشطة
        ),
      ),
      onTap: onTap,
    );
  }
}
