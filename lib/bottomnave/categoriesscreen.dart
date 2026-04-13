import 'package:ecomerce/provider/categorryprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecomerce/colorce/appcolors.dart'; // Categoriprovider path

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsiveness
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<Categoriprovider>(context);

    // Responsive grid delegate calculation based on screen width
    final double itemWidth = size.width / 2.2;
    final double itemHeight = 350; // Total height for each product card
    final double ratio = itemWidth / itemHeight;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leadingWidth: 40,
        leading: Image.asset('assets/applogo.png', height: size.height * 0.025),
        title: const Text(
          "QUICK FASHION",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        actions: const [
          Icon(Icons.search, color: AppColors.black),
          SizedBox(width: 15),
          Icon(Icons.favorite_border, color: AppColors.black),
          SizedBox(width: 15),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const Text(
                "Summer '24",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: ColorStyle.textPrimary,
                ),
              ),
              const Text(
                "CURATED EDIT • 42 ITEMS",
                style: TextStyle(
                  fontSize: 10,
                  color: ColorStyle.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),

              // Filter/Sort Buttons Row
              Row(
                children: [
                  _buildActionButton(Icons.tune, "Filter"),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildActionButton(
                      Icons.sort,
                      "Sort: Featured",
                      isDropdown: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Icon(
                    Icons.grid_view,
                    color: ColorStyle.primary,
                    size: 28,
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Responsive Product Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  childAspectRatio: ratio,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: provider.products.length,
                itemBuilder: (context, index) {
                  final product = provider.products[index];
                  return _buildProductCard(context, product, index, provider);
                },
              ),
              const SizedBox(height: 30),

              // Showing info
              const Center(
                child: Text(
                  "SHOWING 6 OF 42 ITEMS",
                  style: TextStyle(
                    fontSize: 10,
                    color: ColorStyle.textSecondary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Pagination indicators
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 60, height: 2, color: ColorStyle.primary),
                    Container(
                      width: 60,
                      height: 2,
                      color: ColorStyle.border.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Discover More Button
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  gradient: ColorStyle.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    "Discover More",
                    style: TextStyle(
                      color: ColorStyle.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30), // Safe spacing at bottom
            ],
          ),
        ),
      ),
    );
  }

  // Action Button Widget
  Widget _buildActionButton(
    IconData icon,
    String label, {
    bool isDropdown = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: ColorStyle.verifiedBoxBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: ColorStyle.primary, size: 16),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: ColorStyle.textPrimary,
            ),
          ),
          if (isDropdown) ...[
            const SizedBox(width: 5),
            const Icon(
              Icons.expand_more,
              color: ColorStyle.textPrimary,
              size: 16,
            ),
          ],
        ],
      ),
    );
  }

  // Product Card Widget with Logic and Same Image
  Widget _buildProductCard(
    BuildContext context,
    Product product,
    int index,
    Categoriprovider provider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            // Fixed Image: assets/girl.png used for all items
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/girl.png",
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Badges logic (Discount/New)
            if (product.discount.isNotEmpty)
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC01F56),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    product.discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (product.isNew)
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B3BC2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "NEW",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            // Favorite Logic Button (Heart icon)
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => provider.toggleFavorite(index),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: ColorStyle.primary,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Product Details
        Text(
          product.brand,
          style: const TextStyle(
            fontSize: 10,
            color: ColorStyle.textSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          product.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: ColorStyle.textPrimary,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              "₹${product.price.toStringAsFixed(2)}",
              style: const TextStyle(
                color: ColorStyle.primary,
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
            const SizedBox(width: 8),
            if (product.oldPrice != null)
              Text(
                "₹${product.oldPrice!.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: ColorStyle.textLight,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        // Rating Section
        Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 14),
            const SizedBox(width: 4),
            Text(
              product.rating.toString(),
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            Text(
              " (${product.reviews.toString()})",
              style: const TextStyle(fontSize: 11, color: ColorStyle.textLight),
            ),
          ],
        ),
      ],
    );
  }
}
