import 'package:flutter/material.dart';

class Profilesetting extends StatelessWidget {
  const Profilesetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6EDEF),
        elevation: 5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF9E2A47),
          ), // Maroon color
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color(0xFF9E2A47),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF0F3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_search_outlined,
                  color: Color(0xFF9E2A47),
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(child: Text('profile setting screen')),
    );
  }
}
