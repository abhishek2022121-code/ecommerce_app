import 'package:ecomerce/chechoutpage/checkoutscreen.dart';

import 'package:ecomerce/colorce/appcolors.dart';

import 'package:ecomerce/provider/addtobagprovider.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Addtobagscreen extends StatelessWidget {
  const Addtobagscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bag = Provider.of<AddtobagProvider>(context);

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F8),

      appBar: AppBar(
        backgroundColor: ColorStyle.scaffoldBg,

        elevation: 4.0,

        shadowColor: AppColors.black.withOpacity(0.3),

        centerTitle: true,

        leading: Padding(
          padding: const EdgeInsets.all(8.0),

          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: Icon(Icons.arrow_back_ios, color: Color(0xFFC34A5E)),
          ),

          // Image.asset('assets/applogo.png'),
        ),

        title: const Text(
          "QUICK FASHION",

          style: TextStyle(
            color: ColorStyle.textPrimary,

            fontWeight: FontWeight.w900,

            fontSize: 18,
          ),
        ),

        actions: const [
          Icon(Icons.search, color: Color(0xFFC34A5E)),

          SizedBox(width: 15),

          Icon(Icons.shopping_bag_outlined, color: Color(0xFFC34A5E)),

          SizedBox(width: 15),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  "Your Selection",

                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),

                Text(
                  "${bag.items.length} ITEMS",

                  style: const TextStyle(
                    color: Color(0xFFC34A5E),

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Item List
            ListView.builder(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              itemCount: bag.items.length,

              itemBuilder: (context, index) => _buildCartItem(bag, index),
            ),

            // Shipping Address Card (Edit Button inside)
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(
                  0xFFFDF2F4,
                ), // Transparent light accent from UI

                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.local_shipping_outlined,

                            color: Color(0xFFC34A5E),
                          ),

                          SizedBox(width: 10),

                          Text(
                            "Shipping Address",

                            style: TextStyle(
                              fontWeight: FontWeight.w900,

                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      GestureDetector(
                        onTap: () => _showEditAddressDialog(context, bag),

                        child: const Text(
                          "EDIT",

                          style: TextStyle(
                            color: const Color(0xFFC34A5E),

                            fontWeight: FontWeight.w900,

                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Text(
                    bag.userName,

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    bag.userAddress,

                    style: const TextStyle(
                      color: ColorStyle.textSecondary,

                      height: 1.5,

                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Payment Method",

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),

            const SizedBox(height: 15),

            _buildPaymentOption(bag, "Credit Card", Icons.credit_card),

            const SizedBox(height: 10),

            _buildPaymentOption(bag, "Apple Pay", Icons.apple),

            const SizedBox(height: 25),

            _buildCouponSection(),

            const SizedBox(height: 30),

            _buildOrderSummary(context, bag),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(AddtobagProvider bag, int index) {
    final item = bag.items[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: Image.asset(
              item.image,

              width: 85,

              height: 85,

              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  item.name,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,

                    fontSize: 16,
                  ),
                ),

                Text(
                  item.category,

                  style: const TextStyle(
                    color: ColorStyle.textLight,

                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 12),

                // Dynamic Price
                Text(
                  "₹${item.totalPrice.toInt()}",

                  style: const TextStyle(
                    fontWeight: FontWeight.w900,

                    color: const Color(0xFFC34A5E),

                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 35,

            decoration: BoxDecoration(
              color: const Color(0xFFFDF2F4),

              borderRadius: BorderRadius.circular(20),
            ),

            child: Row(
              children: [
                IconButton(
                  onPressed: () => bag.updateQuantity(index, false),

                  icon: const Icon(
                    Icons.remove,

                    size: 14,

                    color: const Color(0xFFC34A5E),
                  ),
                ),

                Text(
                  "${item.quantity}",

                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                IconButton(
                  onPressed: () => bag.updateQuantity(index, true),

                  icon: const Icon(
                    Icons.add,

                    size: 14,

                    color: Color(0xFFC34A5E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
    AddtobagProvider bag,

    String title,

    IconData icon,
  ) {
    bool isSelected = bag.selectedPayment == title;

    return GestureDetector(
      onTap: () => bag.selectPayment(title),

      child: Container(
        padding: const EdgeInsets.all(15),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(15),

          border: Border.all(
            color: isSelected ? Color(0xFFC34A5E) : AppColors.border,
          ),
        ),

        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,

              color: isSelected ? const Color(0xFFC34A5E) : Colors.grey,
            ),

            const SizedBox(width: 15),

            Icon(icon, color: ColorStyle.textPrimary),

            const SizedBox(width: 10),

            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // Pehle function signature check karein ki 'context' wahan hai

  Widget _buildOrderSummary(BuildContext context, AddtobagProvider bag) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(25),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Order Summary",

            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),

          const SizedBox(height: 20),

          _summaryRow("Total MRP", "₹${bag.totalMRP.toStringAsFixed(2)}"),

          _summaryRow("Bag Discount", "-₹${bag.bagDiscount}", isRed: true),

          _summaryRow(
            "Coupon Discount",

            "-₹${bag.couponDiscount}",

            isRed: true,
          ),

          _summaryRow("Shipping Fee", "FREE", isGreen: true),

          const Divider(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                "Total Amount",

                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),

              Text(
                "₹${bag.totalAmount.toStringAsFixed(2)}",

                style: const TextStyle(
                  fontSize: 24,

                  fontWeight: FontWeight.w900,

                  color: Color(0xFFC34A5E),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          GestureDetector(
            onTap: () {
              // debugPrint se check karein agar function trigger ho raha hai

              debugPrint('Navigating to Checkout...');

              Navigator.push(
                context, // Ab ye context function se mil raha hai

                MaterialPageRoute(builder: (context) => const Checkoutscreen()),
              );
            },

            child: Container(
              width: double.infinity,

              height: 60,

              decoration: BoxDecoration(
                color: const Color(0xFFC34A5E),

                borderRadius: BorderRadius.circular(30),
              ),

              child: const Center(
                child: Text(
                  "PLACE ORDER",

                  style: TextStyle(
                    color: Colors.white,

                    fontWeight: FontWeight.w900,

                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Address edit dialog logic

  void _showEditAddressDialog(BuildContext context, AddtobagProvider bag) {
    TextEditingController nameController = TextEditingController(
      text: bag.userName,
    );

    TextEditingController addrController = TextEditingController(
      text: bag.userAddress,
    );

    showDialog(
      context: context,

      builder: (context) => AlertDialog(
        title: const Text("Edit Address"),

        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            TextField(
              controller: nameController,

              decoration: const InputDecoration(labelText: "Name"),
            ),

            TextField(
              controller: addrController,

              decoration: const InputDecoration(labelText: "Address"),

              maxLines: 3,
            ),
          ],
        ),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),

            child: const Text("Cancel"),
          ),

          TextButton(
            onPressed: () {
              bag.updateAddress(nameController.text, addrController.text);

              Navigator.pop(context);
            },

            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String t,

    String v, {

    bool isRed = false,

    bool isGreen = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(t, style: const TextStyle(color: ColorStyle.textSecondary)),

          Text(
            v,

            style: TextStyle(
              fontWeight: FontWeight.bold,

              color: isRed
                  ? Colors.red
                  : (isGreen ? Colors.green : Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  // Coupon Section matching UI

  Widget _buildCouponSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Row(
          children: [
            Icon(
              Icons.local_offer_outlined,

              color: Color(0xFFC34A5E),

              size: 20,
            ),

            SizedBox(width: 10),

            Text(
              "Offers & Coupons",

              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Container(
          padding: const EdgeInsets.all(15),

          decoration: BoxDecoration(
            color: const Color(0xFFFDF2F4),

            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Coupon Code",

                  filled: true,

                  fillColor: Colors.white,

                  suffixIcon: TextButton(
                    onPressed: () {},

                    child: const Text(
                      "APPLY",

                      style: TextStyle(
                        color: Color(0xFFC34A5E),

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),

                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              _couponTile("WELCOME20", "Save 20% on your first order"),

              _couponTile("PULSEFEST", "Complimentary express shipping"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _couponTile(String code, String desc) {
    return Container(
      margin: const EdgeInsets.only(top: 10),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(15),

        border: Border.all(color: Colors.pink.shade50),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                code,

                style: const TextStyle(
                  fontWeight: FontWeight.w900,

                  color: Color(0xFFC34A5E),
                ),
              ),

              Text(
                desc,

                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),

          const Text(
            "SELECT",

            style: TextStyle(
              color: Color(0xFFC34A5E),

              fontWeight: FontWeight.bold,

              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
