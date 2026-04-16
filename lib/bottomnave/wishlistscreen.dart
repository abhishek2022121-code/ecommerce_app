import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/provider/wishlistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wishlistscreen extends StatelessWidget {
  const Wishlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<Wishlistprovider>(context);
    final double itemWidth = (size.width - 45) / 2;
    const double itemHeight = 380;
    final double ratio = itemWidth / itemHeight;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F8),
      appBar: AppBar(
        backgroundColor: ColorStyle.scaffoldBg,
        elevation: 0,
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Wishlist",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF4A3239),
                ),
              ),
              const Text(
                "42 ITEMS",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 25),

              // Filter & Sort Row
              Row(
                children: [
                  _buildActionButton(
                    Icons.tune,
                    "Filter",
                    const Color(0xFFF8D7E0),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildActionButton(
                      Icons.keyboard_arrow_down,
                      "Sort: Featured",
                      const Color(0xFFF9EAEF),
                      isDropdown: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.grid_view_rounded,
                    color: Color(0xFFC34A5E),
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // The Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: ratio,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                ),
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  final product = provider.products[index];
                  return _buildProductCard(context, product, index, provider);
                },
              ),

              const SizedBox(height: 10),
              // const Center(
              //   child: Text(
              //     "SHOWING 6 OF 42 ITEMS",
              //     style: TextStyle(
              //       fontSize: 11,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 15),
              // // Pagination Progress Bar
              // Center(
              //   child: Stack(
              //     children: [
              //       Container(
              //         width: 150,
              //         height: 2,
              //         color: Colors.grey.shade300,
              //       ),
              //       Container(
              //         width: 40,
              //         height: 2,
              //         color: const Color(0xFFC34A5E),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 30),

              // Discover More Button
              // SizedBox(
              //   width: double.infinity,
              //   height: 55,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color(0xFFF8D7E0),
              //       foregroundColor: const Color(0xFF4A3239),
              //       elevation: 0,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //     ),
              //     child: const Text(
              //       "Discover More",
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 100), // Bottom padding for navbar
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String label,
    Color bgColor, {
    bool isDropdown = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: isDropdown
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          if (!isDropdown) Icon(icon, size: 18, color: const Color(0xFFC34A5E)),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A3239),
              fontSize: 14,
            ),
          ),
          if (isDropdown) Icon(icon, size: 18, color: const Color(0xFF4A3239)),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    Product product,
    int index,
    Wishlistprovider provider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/girl.png",
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Badges
            if (product.discount.isNotEmpty)
              Positioned(
                bottom: 10,
                left: 10,
                child: _badge(product.discount, const Color(0xFFC34A5E)),
              ),
            if (product.isNew)
              Positioned(
                bottom: 10,
                left: 10,
                child: _badge("NEW", const Color(0xFF5E5CE6)),
              ),

            // Favorite Button
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => provider.toggleFavorite(index),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite,
                    // favorite_border,
                    size: 18,
                    color: const Color(0xFFC34A5E),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          product.brand,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xFF4A3239),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              "₹${product.price}",
              style: const TextStyle(
                color: Color(0xFFC34A5E),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            if (product.oldPrice != null)
              Text(
                "₹${product.oldPrice}",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.star, color: Color(0xFFC34A5E), size: 12),
            Text(
              " ${product.rating} (${product.reviews})",
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
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
}
