import 'package:ecomerce/addtobag/addtobagscreen.dart';
import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/constomappbar/costomsearchappbar.dart';
import 'package:ecomerce/datilepage/detailescren.dart';
import 'package:ecomerce/provider/wishlistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Now',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorStyle.textPrimary,
                    ),
                  ),
                  Icon(Icons.tune, color: const Color(0xFFC34A5E)),
                ],
              ),
            ),

            // Chips Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildChip('Insta Fashion', true),
                  const SizedBox(width: 10),
                  _buildChip('LUXURY', false),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              image: 'assets/girl.png',
                              name: "Cloud Knit Set",
                              price: "₹250",
                              id: '123',
                            ),
                          ),
                        );
                      },
                      child: _buildLargeProductCard(
                        context,
                        "1",
                        "Cloud Knit Set",
                        "₹250",
                        "TREND: SOFT MINIMAL",
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              image: 'assets/girl.png',
                              name: 'Prism Shades',
                              price: '₹180',
                              id: 'qwj3',
                            ),
                          ),
                        );
                      },
                      child: _buildLargeProductCard(
                        context,
                        "2",
                        "Prism Shades",
                        "₹180",
                        "VIBE: STUDIO GAZE",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/girl.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      "VOGUE X MILAN RUNWAY",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  Positioned(top: 10, left: 10, child: _trendingTag()),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Influencer Picks Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Influencer Picks',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: const Color(0xFFC34A5E),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Grid of products
            GridView.builder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          image: 'assets/girl.png',
                          name: 'product 1',
                          price: '₹500',
                          id: 'xnce',
                        ),
                      ),
                    );
                  },
                  child: _buildGridProduct(
                    context,
                    "id_$index",
                    "Product $index",
                    "₹${(index + 1) * 100}",
                    "BRAND NAME",
                  ),
                );
              },
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.only(
                bottom: 100,
                left: 15,
                right: 15,
                top: 15,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC34A5E).withOpacity(0.2),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'VIEW ALL TRENDS',
                    style: TextStyle(
                      color: const Color(0xFFC34A5E),
                      fontWeight: FontWeight.bold,
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

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFC34A5E) : ColorStyle.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.transparent : ColorStyle.border,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : ColorStyle.textSecondary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLargeProductCard(
    BuildContext context,
    String id,
    String title,
    String price,
    String subtitle,
  ) {
    final product = Product(
      id: id,
      name: title,
      price: price,
      image: 'assets/girl.png',
      brand: subtitle,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/girl.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(top: 10, left: 10, child: _trendingTag()),
            Positioned(top: 10, right: 10, child: _favButton(context, product)),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            color: const Color(0xFFC34A5E),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildGridProduct(
    BuildContext context,
    String id,
    String title,
    String price,
    String brand,
  ) {
    final product = Product(
      id: id,
      name: title,
      price: price,
      image: 'assets/girl.png',
      brand: brand,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/girl.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(top: 8, left: 8, child: _trendingTag()),
              Positioned(top: 8, right: 8, child: _favButton(context, product)),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          brand,
          style: TextStyle(color: ColorStyle.textLight, fontSize: 10),
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(
          price,
          style: TextStyle(
            color: const Color(0xFFC34A5E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _trendingTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFC34A5E),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'TRENDING',
        style: TextStyle(
          color: Colors.white,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _favButton(BuildContext context, Product product) {
    return Consumer<WishlistProvider>(
      builder: (context, provider, child) {
        bool isFav = provider.isFavorite(product.id);
        return GestureDetector(
          onTap: () => provider.toggleWishlist(product),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white.withOpacity(0.7),
            child: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              size: 18,
              color: isFav ? AppColors.error : AppColors.black,
            ),
          ),
        );
      },
    );
  }
}
