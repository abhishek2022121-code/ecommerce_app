import 'dart:io';

import 'package:ecomerce/provider/checkoutorderplacedsuccsefullyprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Checkoutorderplacedsuccessfulyscreen extends StatelessWidget {
  const Checkoutorderplacedsuccessfulyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Checkoutorderplacedsuccessfulyprovider>(
      context,
    );
    final size = MediaQuery.of(context).size;
    final double horizontalPadding = size.width * 0.06;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9FA), // Soft theme background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF8E213D)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Check Out",
          style: TextStyle(
            color: Color(0xFF8E213D),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),

            // Success Image and Message
            Center(
              child: Column(
                children: [
                  // Circular Success Image Placeholder
                  Container(
                    height: size.height * 0.2,
                    width: size.height * 0.2,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8D7DA),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/success_gift.png',
                        ), // Replace with gift image
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Order Placed\nSuccessfully!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF432C31),
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your style upgrade is officially on the\nway.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Order ID & Delivery Status
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: [
                  _buildStatusCard(
                    size,
                    "ORDER ID",
                    provider.orderId,
                    isPrimary: true,
                  ),
                  const SizedBox(width: 15),
                  _buildStatusCard(
                    size,
                    "EST. DELIVERY",
                    provider.estDelivery,
                    isPrimary: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Shipment Details Card
            Container(
              margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF1F3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Shipment Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Color(0xFF432C31),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ...provider.items
                      .map((item) => _buildItemTile(item))
                      .toList(),
                  const Divider(
                    height: 40,
                    thickness: 1,
                    color: Color(0xFFF1D4D9),
                  ),
                  _buildPriceRow("Subtotal", provider.subtotal),
                  _buildPriceRow(
                    "Shipping (Priority)",
                    provider.shipping,
                    isFree: true,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBE4E9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Paid",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          provider.totalPaid,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: Color(0xFF8E213D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Help & Tracking Info
            _buildInfoCard(
              size,
              horizontalPadding,
              Icons.local_shipping_outlined,
              "Track Shipping",
              "Tracking updates will be sent to your email as soon as the package leaves our warehouse.",
            ),
            const SizedBox(height: 15),
            _buildInfoCard(
              size,
              horizontalPadding,
              Icons.headset_mic_outlined,
              "Need Help?",
              "Our concierge team is available 24/7 to assist with your order details.",
            ),

            const SizedBox(height: 40),

            // Continue Shopping Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8E213D), Color(0xFFE37A8F)],
                  ),
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8E213D).withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Continue Shopping",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(
    Size size,
    String label,
    String value, {
    required bool isPrimary,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFFDF1F3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: isPrimary
                    ? const Color(0xFF8E213D)
                    : const Color(0xFF432C31),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemTile(ShipmentItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Size: ${item.size} | Color: ${item.color}",
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 5),
                Text(
                  item.price,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF8E213D),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "x${item.qty}",
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isFree = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: isFree ? Colors.redAccent : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    Size size,
    double padding,
    IconData icon,
    String title,
    String desc,
  ) {
    return GestureDetector(
      onTap: () async {
        print('hello bhai');

        String contactname = "9648628225";

        if (Platform.isAndroid) {
          String url =
              "whatsapp://send?phone=$contactname&text=${Uri.encodeComponent('Hi, I need help')}";
          await launchUrl(Uri.parse(url));
        } else {
          String url =
              "https://wa.me/$contactname?text=${Uri.encodeComponent('Hi, I need help')}";
          await launchUrl(Uri.parse(url));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: padding),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFFDF1F3),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF8E213D), size: 24),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              desc,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
