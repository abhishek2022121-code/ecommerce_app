import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/datilepage/detailescren.dart';
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

      body: items.isEmpty
          ? _buildEmptyState()
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(),
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: AppColors.unselected),
          const SizedBox(height: 20),
          const Text(
            "Your wishlist is empty!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorStyle.textPrimary,
            ),
          ),
        ],
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
