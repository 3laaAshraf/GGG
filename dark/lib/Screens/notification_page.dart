import 'package:flutter/material.dart';

import '../darkMode_cubit/darkCubit.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Property Review Request",
      "message": "Lorem Ipsum is simply dummy text of the printing industry",
      "time": "09:40 AM",
      "icon": Icons.star,
      "section": "Today"
    },
    {
      "title": "Congratulations, you got a gift",
      "message": "Lorem Ipsum is simply dummy text of the printing industry",
      "time": "09:40 AM",
      "icon": Icons.card_giftcard,
      "section": "Today"
    },
    {
      "title": "New Update Available!",
      "message": "Update safely and get a better trip experience!",
      "time": "09:40 AM",
      "icon": Icons.update,
      "section": "Yesterday"
    },
    {
      "title": "Tour Booked Successfully",
      "message": "Lorem Ipsum is simply dummy text of the printing industry",
      "time": "09:40 AM",
      "icon": Icons.calendar_today,
      "section": "Yesterday"
    },
    {
      "title": "You Earned 20 Points!",
      "message": "Lorem Ipsum is simply dummy text of the printing industry",
      "time": "09:40 AM",
      "icon": Icons.check_circle,
      "section": "June 20, 2024"
    },
    {
      "title": "Congratulations, you got a gift",
      "message": "Lorem Ipsum is simply dummy text of the printing industry",
      "time": "09:40 AM",
      "icon": Icons.card_giftcard,
      "section": "June 20, 2024"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewsCubit.get(context).isDark
          ? const Color(0xFF222831)
          : Colors.white, // Dark theme
      appBar: AppBar(
        backgroundColor: Color(0xFF222831),
        title: Text("Notification", style: TextStyle(color: Color(0xFFFCC876))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFFCC876)),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: buildNotificationList(),
      ),
    );
  }

  List<Widget> buildNotificationList() {
    Map<String, List<Map<String, dynamic>>> groupedNotifications = {};

    for (var notification in notifications) {
      String section = notification["section"];
      if (!groupedNotifications.containsKey(section)) {
        groupedNotifications[section] = [];
      }
      groupedNotifications[section]!.add(notification);
    }

    List<Widget> listItems = [];
    groupedNotifications.forEach((section, items) {
      listItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            section,
            style: TextStyle(
                color: Color(0xFFFCC876),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      );

      for (var item in items) {
        listItems.add(
          ListTile(
            leading: Icon(item["icon"], color: Colors.white),
            title: Text(item["title"],
                style: TextStyle(
                    color: NewsCubit.get(context).isDark
                        ? const Color.fromARGB(255, 254, 254, 254)
                        : const Color(0xFF115173),
                    fontWeight: FontWeight.bold)),
            subtitle: Text(item["message"],
                style: TextStyle(
                  color: NewsCubit.get(context).isDark
                      ? const Color.fromARGB(255, 173, 173, 173)
                      : const Color.fromARGB(255, 103, 126, 145),
                )),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item["time"],
                    style: TextStyle(
                        color: NewsCubit.get(context).isDark
                            ? const Color(0xFFFCC876)
                            : const Color(0xFF115173),
                        fontSize: 12)),
                Icon(Icons.circle, color: Color(0xFFFCC876), size: 10),
              ],
            ),
          ),
        );
      }
    });

    return listItems;
  }
}
