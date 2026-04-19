import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecomerce/addtobag/addtobagscreen.dart';
import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/provider/productdetaileprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:ecomerce/colorce/appcolors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<ProductDetailsProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F8),

      appBar: AppBar(
        backgroundColor: ColorStyle.scaffoldBg,
        elevation: 4.0,

        shadowColor: AppColors.black.withOpacity(0.3),

        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/applogo.png'),
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
          Icon(Icons.search, color: ColorStyle.primary),
          SizedBox(width: 15),
          Icon(Icons.shopping_bag_outlined, color: ColorStyle.primary),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Product Image
            Container(
              height: size.width,
              width: size.width,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: AssetImage('assets/girl.png'), // Main Bag Image
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Thumbnails
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (index) => _buildThumbnail(size.width),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "NEW ARRIVAL",
                    style: TextStyle(
                      color: Color(0xFFC34A5E),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Pulse Aura Bag",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF4A3239),
                    ),
                  ),
                  const Text(
                    "\$1,250.00",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC34A5E),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Text(
                    "SELECT COLOR: CRIMSON MUSE",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: List.generate(
                      provider.productColors.length,
                      (index) => _buildColorDot(index, provider),
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SELECT SIZE",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Size Guide",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC34A5E),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: provider.sizes
                        .map((s) => _buildSizeBox(s, provider, size.width))
                        .toList(),
                  ),

                  const SizedBox(height: 30),
                  _expandableSection(
                    "Product Description",
                    "Crafted from Italian pebble-grain leather, the Aura Bag features a signature sculptural silhouette inspired by mid-century architecture. Our most coveted accessory blends artisanal craftsmanship with modern utility.",
                  ),
                  const SizedBox(height: 10),
                  _expandableSection(
                    "Material & Care",
                    "100% Genuine Italian Leather. Professional leather clean only.",
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "Customer Reviews",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF4A3239),
                    ),
                  ),
                  _buildReviewHeader(),
                  const SizedBox(height: 20),
                  _buildReviewTile(
                    "Isabella Rossi",
                    "The quality of the leather is absolutely stunning. It feels even more premium in person than it looks in the photos. The structured shape stays perfect even when fully loaded. Best investment this season!",
                    "assets/girl.png",
                  ),
                  const SizedBox(height: 15),
                  _buildReviewTile(
                    "Marcus Chen",
                    "Bought this as a gift and the packaging alone was worth it. The craftsmanship on the hardware is immaculate. Only wish it came with a slightly longer crossbody strap.",
                    null,
                  ),

                  const SizedBox(height: 40),
                  const Text(
                    "Complete The Look",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF4A3239),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildCompleteLookGrid(size.width),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomActionBar(context, provider),
    );
  }

  // --- Widget Helpers ---

  Widget _buildThumbnail(double width) {
    return Container(
      width: width * 0.28,
      height: width * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage('assets/girl.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildColorDot(int index, ProductDetailsProvider provider) {
    bool isSelected = provider.selectedColorIndex == index;
    return GestureDetector(
      onTap: () => provider.selectColor(index),
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFF4A3239) : Colors.transparent,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          radius: 14,
          backgroundColor: provider.productColors[index],
        ),
      ),
    );
  }

  Widget _buildSizeBox(
    String sizeName,
    ProductDetailsProvider provider,
    double width,
  ) {
    bool isSelected = provider.selectedSize == sizeName;
    return GestureDetector(
      onTap: () => provider.selectSize(sizeName),
      child: Container(
        width: width * 0.2,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF9EAEF) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? const Color(0xFFC34A5E) : Colors.grey.shade300,
          ),
        ),
        child: Center(
          child: Text(
            sizeName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? const Color(0xFFC34A5E) : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _expandableSection(String title, String body) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF2F4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            expandedAlignment: Alignment.topLeft,
            childrenPadding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),

            // Icon color logic
            iconColor: const Color(0xFFC34A5E),
            collapsedIconColor: const Color(0xFFC34A5E),

            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Color(0xFF4A3239), // Dark brown color
              ),
            ),
            children: [
              Text(
                body,
                style: const TextStyle(
                  color: Color(0xFF8E7A7F), // Subtle grey-brown text
                  height: 1.5,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       title,
          //       style: const TextStyle(
          //         fontWeight: FontWeight.w900,
          //         fontSize: 16,
          //         color: Color(0xFF4A3239),
          //       ),
          //     ),
          //     const Icon(Icons.keyboard_arrow_up, color: Color(0xFFC34A5E)),
          //   ],
          // ),
          // const SizedBox(height: 10),
          // Text(
          //   body,
          //   style: const TextStyle(
          //     color: Colors.grey,
          //     height: 1.5,
          //     fontSize: 13,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildReviewHeader() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "4.8",
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                color: Color(0xFF4A3239),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RatingBar(
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      filledColor: Color(0xFFC34A5E),
                      size: 25,
                      emptyColor: Colors.red.shade200,
                      onRatingChanged: (value) => debugPrint('$value'),
                      initialRating: 3,
                      maxRating: 5,
                    ),
                    // Icon(Icons.star, color: Color(0xFFC34A5E), size: 20),
                    // Icon(Icons.star, color: Color(0xFFC34A5E), size: 20),
                    // Icon(Icons.star, color: Color(0xFFC34A5E), size: 20),
                    // Icon(Icons.star, color: Color(0xFFC34A5E), size: 20),
                    // Icon(Icons.star, color: Color(0xFFC34A5E), size: 20),
                  ],
                ),
                const Text(
                  "BASED ON 128 REVIEWS",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        _reviewBar("5", 0.85),
        _reviewBar("4", 0.10),
        _reviewBar("3", 0.03),
      ],
    );
  }

  Widget _reviewBar(String label, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            // TweenAnimationBuilder use kiya hai smooth animation ke liye
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: percent),
              duration: const Duration(milliseconds: 800), // Animation ki speed
              curve: Curves.easeInOutQuart, // Animation ka style
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value, // Animate hone wali value
                  backgroundColor: Colors.pink.shade50,
                  color: const Color(0xFFC34A5E),
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(5),
                );
              },
            ),
          ),
          const SizedBox(width: 10),

          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: percent),
            duration: const Duration(milliseconds: 800),
            builder: (context, value, child) {
              return Text(
                "${(value * 100).toInt()}%",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviewTile(String name, String content, String? img) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/user.png'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      RatingBar(
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        filledColor: Color(0xFFC34A5E),
                        size: 17,
                        emptyColor: Colors.red.shade200,
                        onRatingChanged: (value) => debugPrint('$value'),
                        initialRating: 3,
                        maxRating: 5,
                      ),
                      //   Icon(Icons.star, color: Color(0xFFC34A5E), size: 12),
                      //   Icon(Icons.star, color: Color(0xFFC34A5E), size: 12),
                      //   Icon(Icons.star, color: Color(0xFFC34A5E), size: 12),
                      //   Icon(Icons.star, color: Color(0xFFC34A5E), size: 12),
                      //   Icon(Icons.star, color: Color(0xFFC34A5E), size: 12),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                "VERIFIED BUYER",
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            content,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 13,
              height: 1.5,
            ),
          ),
          if (img != null) ...[
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(img, width: 60, height: 60, fit: BoxFit.cover),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCompleteLookGrid(double width) {
    final List<Map<String, String>> lookItems = [
      {"name": "Silk Mirage Scarf", "price": "\$145.00"},
      {"name": "Prism Gold Cuff", "price": "\$320.00"},
      {"name": "Aura Suede Heels", "price": "\$650.00"},
      {"name": "Atelier Trench", "price": "\$890.00"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/girl.png', fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              lookItems[index]['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
              lookItems[index]['price']!,
              style: const TextStyle(
                color: Color(0xFFC34A5E),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomActionBar(
    BuildContext context,
    ProductDetailsProvider provider,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
      ),
      child: Row(
        children: [
          // Favorite Icon
          GestureDetector(
            onTap: () => provider.toggleFavorite(),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFC34A5E)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                provider.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: const Color(0xFFC34A5E),
              ),
            ),
          ),
          const SizedBox(width: 15),

          // Add to Bag Button
          Expanded(
            child: InkWell(
              // InkWell use karein tap effect ke liye
              onTap: () {
                debugPrint('Navigating to Bag...');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Addtobagscreen(),
                  ),
                );
              },
              child: Container(
                height: 55, // Height thodi badhai for better UI
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFC34A5E), Color(0xFFE47A8F)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFC34A5E).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: 22,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "ADD TO BAG",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
