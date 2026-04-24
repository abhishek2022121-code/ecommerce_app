import 'package:flutter/material.dart';

class Cencelpage extends StatelessWidget {
  const Cencelpage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // List for Cancelled orders
    final List<Map<String, dynamic>> cancelledOrders = [
      {
        "title": "Midnight Stilettos",
        "id": "#VP-544109",
        "date": "AUG 12, 2023",
        "price": 160.00,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF0F3), // Light pink background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Cancelled",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 10,
        ),
        itemCount: cancelledOrders.length,
        itemBuilder: (context, index) {
          final order = cancelledOrders[index];
          return _buildCancelledCard(order, screenWidth);
        },
      ),
    );
  }

  Widget _buildCancelledCard(Map<String, dynamic> order, double screenWidth) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Container
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                "assets/girl.png", // Aapka asset image
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Title and Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order['title'],
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹${order['price'].toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB33A5B),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),
          // Order ID and Cancelled Date
          Row(
            children: [
              Text(
                "ORDER ID: ${order['id']}",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              ),
              const Spacer(),
              Text(
                "CANCELLED: ${order['date']}",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0)),
          ),

          // Cancelled Status Indicator
          Row(
            children: const [
              Icon(Icons.cancel_outlined, size: 18, color: Colors.red),
              const SizedBox(width: 8),
              Text(
                "ORDER CANCELLED",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // View Similar Button (Full Width)
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFFFFE4E9),
                foregroundColor: const Color(0xFFB33A5B),
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "VIEW SIMILAR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
