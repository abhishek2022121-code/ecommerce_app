import 'package:ecomerce/orderdetaile/orderdetailscreen.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xFF70122B)),
        ),
        title: Text(
          'My Orders',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFC3374E),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Color(0xFF70122B)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Color(0xFF70122B)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SHOPPING ACTIVITY",
              style: TextStyle(
                color: Color(0xFFC3374E),
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFF4A0E1E),
                  height: 1.1,
                ),
                children: const [
                  TextSpan(text: "Track Your "),
                  TextSpan(
                    text: "Style\nJourney",
                    style: TextStyle(color: Color(0xFFC3374E)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Filter Tabs
            Row(
              children: [
                _buildFilterChip("All Orders", true),
                _buildFilterChip("In Transit", false),
                _buildFilterChip("Delivered", false),
              ],
            ),
            const SizedBox(height: 25),

            // 1. IN TRANSIT CARD (Yellow Trousers)
            _buildTransitCard(context),

            const SizedBox(height: 20),

            // 2. DELIVERED CARD (Handbag)
            _buildDeliveredCard(
              title: "Silk Gala Handbag",
              price: "₹345.50",
              orderId: "#VP-712893",
              date: "OCT 15, 2023",
              imagePath: "assets/girl.png", // Replace with your image
            ),

            const SizedBox(height: 20),

            // 3. DELIVERED CARD (Blazer)
            _buildDeliveredCard(
              title: "Icon Oversized Blazer",
              price: "₹220.00",
              orderId: "#VP-655412",
              date: "SEPT 28, 2023",
              imagePath: "assets/girl.png", // Replace with your image
            ),

            const SizedBox(height: 20),

            // 4. CANCELLED CARD (Stilettos)
            _buildCancelledCard(),

            const SizedBox(height: 30),

            // RECOMMENDED SECTION
            const Text(
              "Recommended for You",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A0E1E),
              ),
            ),
            const SizedBox(height: 15),
            _buildRecommendedList(width),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Filter Chip
  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE57373) : const Color(0xFFF3E5E5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600],
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  // Transit Card (Main Item)
  Widget _buildTransitCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEFEF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Image.asset('assets/girl.png'),
            ), // Replace with local asset
          ),
          const SizedBox(height: 15),
          _statusBadge("IN TRANSIT", const Color(0xFFB03050)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Vogue Sculpt\nTrousers",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A0E1E),
                ),
              ),
              Text(
                "₹189.00",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC3374E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "ORDER ID: #VP-829102    PLACED: OCT 24, 2023",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.local_shipping_outlined,
                      size: 18,
                      color: Color(0xFFB03050),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Estimated delivery: Oct 28, 2023",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.grey[200],
                  color: const Color(0xFFE57373),
                  minHeight: 6,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _largeButton(
            context,
            "TRACK ORDER",
            const Color(0xFFC3374E),
            Colors.white,
          ),
          const SizedBox(height: 10),
          _largeButton(
            context,
            "ORDER DETAILS",
            const Color(0xFFF8D7DA),
            const Color(0xFF70122B),
          ),
        ],
      ),
    );
  }

  // Delivered Card (Common for Bag and Blazer)
  Widget _buildDeliveredCard({
    required String title,
    required String price,
    required String orderId,
    required String date,
    required String imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset('assets/girl.png', fit: BoxFit.cover),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF4A0E1E),
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF4A0E1E),
                ),
              ),
            ],
          ),
          Text(
            "$orderId   DELIVERED: $date",
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.green, size: 16),
              SizedBox(width: 5),
              Text(
                "DELIVERED SUCCESSFULLY",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: _actionButton("REORDER")),
              const SizedBox(width: 10),
              Expanded(child: _actionButton("WRITE REVIEW")),
            ],
          ),
        ],
      ),
    );
  }

  // Cancelled Card
  Widget _buildCancelledCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEFEF).withOpacity(0.6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: double.infinity,
            child: Image.asset('assets/girl.png', fit: BoxFit.cover),
          ),
          const Text(
            "Midnight Stilettos",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF4A0E1E),
            ),
          ),
          const Text(
            "#VP-544109   CANCELLED: AUG 12, 2023",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.cancel, color: Colors.redAccent, size: 16),
              SizedBox(width: 5),
              Text(
                "ORDER CANCELLED",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(width: 150, child: _actionButton("VIEW SIMILAR")),
        ],
      ),
    );
  }

  // Recommended List
  Widget _buildRecommendedList(double width) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _recommendationItem("Ethereal Bloom Dress", "₹125", width),
          const SizedBox(width: 15),
          _recommendationItem("Nimbus Sneakers", "₹89", width),
          const SizedBox(width: 15),
          _recommendationItem("Nimbus Sneakers", "₹89", width),
          const SizedBox(width: 15),
          _recommendationItem("Nimbus Sneakers", "₹89", width),
        ],
      ),
    );
  }

  Widget _recommendationItem(String name, String price, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width * 0.42,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('assets/girl.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Color(0xFF4A0E1E),
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            color: Color(0xFFC3374E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Helper Widgets
  Widget _statusBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _largeButton(
    BuildContext context,
    String text,
    Color bgColor,
    Color textColor,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderDetailsScreen()),
          );
        },
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _actionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8D7DA),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF70122B),
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
