import 'package:ecomerce/chechoutpage/checkoutorderplacedsuccessfuly.dart';
import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/constomappbar/costomloginappbar.dart';
import 'package:ecomerce/provider/checkoutordersummeryprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkoutordersummeryscreen extends StatelessWidget {
  const Checkoutordersummeryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Checkoutordersummeryprovider>(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: CustomLoginAppBar(
        leadingIcon: const Icon(Icons.arrow_back_ios, color: Color(0xFFC34A5E)),
        title: 'Check Out',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Text(
              "STEP 03 OF 03",
              style: TextStyle(
                color: Color(0xFFC34A5E),
                fontWeight: FontWeight.bold,
                fontSize: 11,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Order Summary",
              style: TextStyle(
                fontSize: 34, // Increased size for impact
                fontWeight: FontWeight.w900,
                color: Color(0xFF4A3239),
                height: 1.1,
              ),
            ),
            const SizedBox(height: 30),

            // 1. Shipping To Section
            _buildShippingCard(provider),

            const SizedBox(height: 35),
            const Text(
              "Your Selection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4A3239),
              ),
            ),
            const SizedBox(height: 15),

            // 2. Horizontal Item List with Overlay
            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.selectedItems.length,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) =>
                    _buildItemCard(provider.selectedItems[index]),
              ),
            ),

            const SizedBox(height: 35),

            // 3. Calculation Card
            _buildPriceDetailsCard(provider),

            const SizedBox(height: 25),

            // 4. Feature Icons
            _buildFeatureIcons(),

            const SizedBox(height: 40),

            // 5. Proceed Button
            _buildProceedButton(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingCard(Checkoutordersummeryprovider provider) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Shipping To",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                  color: Color(0xFF4A3239),
                ),
              ),
              GestureDetector(
                onTap: () => provider.changeShipping(),
                child: const Text(
                  "CHANGE",
                  style: TextStyle(
                    color: Color(0xFFC34A5E),
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF2F4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.home_outlined,
                  color: Color(0xFFC34A5E),
                  size: 26,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      provider.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 17,
                        color: Color(0xFF4A3239),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      provider.address,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      provider.phone,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(OrderItem item) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(item.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            stops: const [0.6, 1.0],
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              "QTY: ${item.qty.toString().padLeft(2, '0')}",
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetailsCard(Checkoutordersummeryprovider provider) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC34A5E).withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          _summaryRow("Bag Total", "₹${provider.bagTotal.toStringAsFixed(2)}"),
          _summaryRow(
            "Bag Discount",
            "-₹${provider.bagDiscount.toStringAsFixed(2)}",
            isRed: true,
          ),
          const SizedBox(height: 10),
          // Coupon Design matching Screenshot Step 3
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF2F4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.confirmation_num_outlined,
                      size: 18,
                      color: Color(0xFFC34A5E),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "WELCOME20",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: Color(0xFF4A3239),
                      ),
                    ),
                  ],
                ),
                Text(
                  "-₹${provider.couponDiscount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Color(0xFFC34A5E),
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _summaryRow("GST (18%)", "₹${provider.gstAmount.toStringAsFixed(2)}"),
          _summaryRow(
            "Delivery Charges",
            "FREE",
            isGreen: true,
            oldPrice: "₹25.00",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(color: Color(0xFFF1F1F1), thickness: 1.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Total Amount",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF4A3239),
                    ),
                  ),
                  Text(
                    "INCLUSIVE OF ALL TAXES",
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              Text(
                "₹${provider.totalAmount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF4A3239),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _featureItem(Icons.verified_user_outlined, "SECURE PAYMENT"),
        _featureItem(Icons.local_shipping_outlined, "INSURED SHIPPING"),
        _featureItem(Icons.history_outlined, "30 DAY RETURN"),
      ],
    );
  }

  static Widget _featureItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade400),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w800,
            color: Colors.grey.shade500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  // 1. BuildContext yahan add karein
  Widget _buildProceedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // debugPrint se console check karein
        debugPrint('Navigating to Success Screen...');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Checkoutorderplacedsuccessfulyscreen(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 68,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFC34A5E), Color(0xFFE47A8F)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFC34A5E).withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "PROCEED TO PAYMENT",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
              Row(
                children: const [
                  Text(
                    "Step 3/3",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(
    String t,
    String v, {
    bool isRed = false,
    bool isGreen = false,
    String? oldPrice,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            t,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
            ),
          ),
          Row(
            children: [
              if (oldPrice != null)
                Text(
                  "$oldPrice ",
                  style: const TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 13,
                  ),
                ),
              Text(
                v,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: isRed
                      ? Colors.red
                      : (isGreen ? Colors.green : const Color(0xFF4A3239)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
