import 'package:ecomerce/chechoutpage/ckeckoutordersummeryscreen.dart';
import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/constomappbar/costomloginappbar.dart';
import 'package:ecomerce/provider/checkoutscreenprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import your color classes and provider

class Checkoutscreen extends StatelessWidget {
  const Checkoutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CheckoutScreenProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: CustomLoginAppBar(
        leadingIcon: const Icon(Icons.arrow_back_ios, color: Color(0xFFC34A5E)),
        title: 'Check Out',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "STEP 02",
              style: TextStyle(
                color: Color(0xFFC34A5E),
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Shipping Destination",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xFF4A3239),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Select a curated delivery point for your seasonal arrivals.",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 30),

            // Address List
            Expanded(
              child: ListView(
                children: [
                  ...provider.addresses
                      .map(
                        (address) =>
                            _buildAddressCard(context, provider, address),
                      )
                      .toList(),

                  // Add New Address Button
                  GestureDetector(
                    onTap: () => _showAddAddressDialog(context, provider),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFC34A5E).withOpacity(0.3),
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Color(0xFFC34A5E), size: 20),
                          SizedBox(width: 10),
                          Text(
                            "Add New Address",
                            style: TextStyle(
                              color: Color(0xFFC34A5E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Confirm Button
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkoutordersummeryscreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFC34A5E), Color(0xFFE47A8F)],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFC34A5E).withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Confirm Address",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard(
    BuildContext context,
    CheckoutScreenProvider provider,
    AddressModel address,
  ) {
    bool isSelected = provider.selectedAddressId == address.id;

    return GestureDetector(
      onTap: () => provider.selectAddress(address.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFFC34A5E) : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        address.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: Color(0xFF4A3239),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFC34A5E,
                          ).withOpacity(isSelected ? 0.8 : 0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          address.tag,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFFC34A5E),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    address.address,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_android_outlined,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        address.phone,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected
                  ? const Color(0xFFC34A5E)
                  : Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddAddressDialog(
    BuildContext context,
    CheckoutScreenProvider provider,
  ) {
    // Basic implementation for "Add New Address" logic
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Address"),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(decoration: InputDecoration(hintText: "Full Name")),
            TextField(
              decoration: InputDecoration(hintText: "Tag (Home/Office)"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Address"),
              maxLines: 2,
            ),
            TextField(decoration: InputDecoration(hintText: "Phone")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // Dummy new address adding logic
              provider.addNewAddress(
                AddressModel(
                  id: DateTime.now().toString(),
                  name: "New User",
                  tag: "NEW",
                  address: "New Added Street, NY",
                  phone: "+1 (000) 000-0000",
                ),
              );
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
