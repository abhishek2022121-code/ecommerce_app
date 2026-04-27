import 'package:ecomerce/addtobag/addtobagscreen.dart';
import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/constomappbar/costomsearchappbar.dart';
import 'package:ecomerce/datilepage/detailescren.dart';
import 'package:ecomerce/productlisting/iteamcollections.dart';
import 'package:ecomerce/provider/wishlistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'path_to_your_colors/app_colors.dart';
// import 'path_to_your_provider/wishlist_provider.dart';

class Wishlistscreen extends StatelessWidget {
  const Wishlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<WishlistProvider>(context);
    final items = provider.wishlistItems;

    final double itemWidth = (size.width - 45) / 2;
    const double itemHeight = 360;
    final double ratio = itemWidth / itemHeight;

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F8),
      appBar: CustomSearchAppBar(
        title: 'QUICK FASHION',
        onBagPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addtobagscreen()),
          );
        },
      ),
      body: items.isEmpty
          ? _buildEmptyState(context)
          : SingleChildScrollView(
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
                    Text(
                      "${items.length} ITEMS",
                      style: const TextStyle(
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

                    // Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: ratio,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            final product = items[index];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  image: product.image,
                                  name: product.name,
                                  price: product.price,
                                  id: product.id,
                                ),
                              ),
                            );
                          },
                          child: _buildProductCard(
                            context,
                            items[index],
                            provider,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular Icon Background
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFF0808F), // Screenshot pink shade
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.favorite_border,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Heading Text
            const Text(
              "Nothing in Your Wishlist",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF332F32), // Dark text color
              ),
            ),
            const SizedBox(height: 12),
            // Subtitle Text
            const Text(
              "Save the looks you love and curate your dream closet.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF8E7D84), // Greyish text color
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),
            // Gradient Button
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Color(0xFFC34A5E), Color(0xFFE88A98)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFC34A5E).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  print('object');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Iteamcollections()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "START SHOPPING",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
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
    WishlistProvider provider,
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
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => provider.toggleWishlist(product),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    Icons.favorite,
                    size: 18,
                    color: Color(0xFFC34A5E),
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
        Text(
          "₹${product.price}",
          style: const TextStyle(
            color: Color(0xFFC34A5E),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
