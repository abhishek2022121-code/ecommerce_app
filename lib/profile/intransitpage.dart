import 'package:flutter/material.dart';

class Intransitpage extends StatelessWidget {
  const Intransitpage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Hardcoded list for "In Transit" orders specifically
    final List<Map<String, dynamic>> inTransitOrders = [
      {
        "title": "Vogue Sculpt Trousers",
        "id": "#VP-829102",
        "date": "OCT 24, 2023",
        "price": 189.00,
        "deliveryDate": "Oct 28, 2023",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF0F3), // Light pink background
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 10,
        ),
        itemCount: inTransitOrders.length,
        itemBuilder: (context, index) {
          final order = inTransitOrders[index];
          return _buildInTransitCard(context, order, screenWidth);
        },
      ),
    );
  }

  Widget _buildInTransitCard(
    BuildContext context,
    Map<String, dynamic> order,
    double screenWidth,
  ) {
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
          // Image Container
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
                "assets/girl.png", // Using your asset
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Status Badge
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFB33A5B),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "IN TRANSIT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),

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
          Row(
            children: [
              Text(
                "ORDER ID: ${order['id']}",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              ),
              const Spacer(),
              Text(
                "PLACED: ${order['date']}",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0)),
          ),

          // Delivery Info
          Row(
            children: [
              const Icon(
                Icons.local_shipping_outlined,
                size: 18,
                color: Color(0xFFB33A5B),
              ),
              const SizedBox(width: 8),
              Text(
                "Estimated delivery: ${order['deliveryDate']}",
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Track Order Button (Primary)
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFFB33A5B),
                foregroundColor: Colors.white,
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "TRACK ORDER",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Order Details Button (Secondary)
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
                "ORDER DETAILS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
