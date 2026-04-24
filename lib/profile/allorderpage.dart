import 'package:ecomerce/provider/allorederprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllOrderPage extends StatelessWidget {
  const AllOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Assuming you have your Provider set up
    final orders = Provider.of<AllOrderProvider>(context).orders;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF0F3), // Light pink background
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Orders List
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orders.length,
              itemBuilder: (context, index) => OrderCard(order: orders[index]),
            ),

            const SizedBox(height: 25),
            const Text(
              "Recommended for You",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A2B2B), // Fixed color hex
              ),
            ),
            const SizedBox(height: 15),

            // Recommendations Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRecommendationCard(
                  screenWidth,
                  "Ethereal Bloom Dress",
                  "₹125",
                ),
                const SizedBox(width: 15),
                _buildRecommendationCard(screenWidth, "Nimbus Sneakers", "₹89"),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(double width, String title, String price) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              image: const DecorationImage(
                image: AssetImage("assets/girl.png"), // Updated to your asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 2),
          Text(
            price,
            style: const TextStyle(
              color: Color(0xFFB33A5B),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final OrderItem order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(
          0.7,
        ), // Glassy white look from screenshot
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Product Image Area
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
                "assets/girl.png", // Updated to your asset
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Status Badge (In Transit)
          if (order.status == "In Transit")
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
                order.title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "₹${order.price.toStringAsFixed(2)}",
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
                "ORDER ID: ${order.id}",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                "PLACED: ${order.date}",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0)),
          ),

          // Status Specific Row/Buttons
          if (order.status == "In Transit") ...[
            Row(
              children: [
                const Icon(
                  Icons.local_shipping_outlined,
                  size: 18,
                  color: Color(0xFFB33A5B),
                ),
                const SizedBox(width: 8),
                Text(
                  "Estimated delivery: ${order.deliveryDate}",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            _buildWideButton("TRACK ORDER", isPrimary: true),
            const SizedBox(height: 10),
            _buildWideButton("ORDER DETAILS", isPrimary: false),
          ] else if (order.status == "Delivered") ...[
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
            Row(
              children: [
                Expanded(child: _buildPillButton("REORDER")),
                const SizedBox(width: 12),
                Expanded(child: _buildPillButton("WRITE REVIEW")),
              ],
            ),
          ] else if (order.status == "Cancelled") ...[
            Row(
              children: const [
                Icon(Icons.cancel_outlined, size: 18, color: Colors.red),
                SizedBox(width: 8),
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
            _buildWideButton("VIEW SIMILAR", isPrimary: false),
          ],
        ],
      ),
    );
  }

  // Helper for Full Width Buttons
  Widget _buildWideButton(String label, {required bool isPrimary}) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isPrimary
              ? const Color(0xFFB33A5B)
              : const Color(0xFFFFE4E9),
          foregroundColor: isPrimary ? Colors.white : const Color(0xFFB33A5B),
          shape: const StadiumBorder(),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }

  // Helper for Small Side-by-Side Buttons
  Widget _buildPillButton(String label) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color(0xFFFFE4E9),
          foregroundColor: const Color(0xFFB33A5B),
          shape: const StadiumBorder(),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}
