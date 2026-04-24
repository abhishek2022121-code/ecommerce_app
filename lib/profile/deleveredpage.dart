import 'package:flutter/material.dart';

class Deleveredpage extends StatelessWidget {
  const Deleveredpage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // List for Delivered orders
    final List<Map<String, dynamic>> deliveredOrders = [
      {
        "title": "Silk Gala Handbag",
        "id": "#VP-712893",
        "date": "OCT 15, 2023",
        "price": 345.50,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDF0F3), // Same pinkish background
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 10,
        ),
        itemCount: deliveredOrders.length,
        itemBuilder: (context, index) {
          final order = deliveredOrders[index];
          return _buildDeliveredCard(order, screenWidth);
        },
      ),
    );
  }

  Widget _buildDeliveredCard(Map<String, dynamic> order, double screenWidth) {
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
                "assets/girl.png", // Aapka asset
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
          // Order ID and Date
          Row(
            children: [
              Text(
                "ORDER ID: ${order['id']}",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              ),
              const Spacer(),
              Text(
                "DELIVERED: ${order['date']}",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0)),
          ),

          // Success Status Indicator
          Row(
            children: const [
              Icon(Icons.check_circle, size: 18, color: Colors.green),
              SizedBox(width: 8),
              Text(
                "DELIVERED SUCCESSFULLY",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Buttons Row (Side by Side)
          Row(
            children: [
              Expanded(
                child: SizedBox(
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
                      "REORDER",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
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
                      "WRITE REVIEW",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
