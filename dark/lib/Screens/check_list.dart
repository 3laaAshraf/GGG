import 'package:flutter/material.dart';

import '../darkMode_cubit/darkCubit.dart';

class CheckList extends StatefulWidget {
  const CheckList({super.key});

  @override
  _CheckList createState() => _CheckList();
}

class _CheckList extends State<CheckList> {
  final List<Map<String, dynamic>> packingItems = [
    {'name': 'Passport', 'checked': false},
    {'name': 'Travel Tickets', 'checked': false},
    {'name': 'Clothes', 'checked': false},
    {'name': 'Toiletries', 'checked': false},
    {'name': 'Medications', 'checked': false},
  ];

  final TextEditingController _customItemController = TextEditingController();

  void _addCustomItem(String itemName) {
    setState(() {
      packingItems.add({'name': itemName, 'checked': false});
    });
    _customItemController.clear();
  }

  void _toggleCheck(int index) {
    setState(() {
      packingItems[index]['checked'] = !packingItems[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewsCubit.get(context).isDark
          ? const Color(0xFF222831)
          : Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        title: Center(
            child: Text('Packing Checklist',
                style: TextStyle(
                    color: Color(0xffffc876),
                    fontSize: 18,
                    fontWeight: FontWeight.bold))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: packingItems.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                      packingItems[index]['name'],
                      style: TextStyle(
                        color: NewsCubit.get(context).isDark
                            ? const Color(0xFFEEEEEE)
                            : const Color(0xFF115173),
                      ),
                    ),
                    value: packingItems[index]['checked'],
                    onChanged: (bool? value) {
                      _toggleCheck(index);
                    },
                    activeColor:
                        Color(0xffffc876), // Checkbox color when checked
                    checkColor: Colors
                        .black, // Color of the check mark inside the checkbox
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _customItemController,
                    style: TextStyle(color: Color(0xff115173)),
                    decoration: InputDecoration(
                      labelText: 'Add custom item',
                      labelStyle: TextStyle(color: Color(0xff115173)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(
                                0xff115173)), // Border color when not focused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                Color(0xffffc876)), // Border color when focused
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Color(0xff115173),
                  ),
                  onPressed: () {
                    if (_customItemController.text.isNotEmpty) {
                      _addCustomItem(_customItemController.text);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Reminders',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffc876)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff115173), // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
              ),
              onPressed: () {
                // Logic to schedule a reminder
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Reminder set for travel documents!')),
                );
              },
              child: Text(
                'Set Reminder for Documents',
                style: TextStyle(color: Color(0xffffc876)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
