import 'package:ecomerce/addtobag/addtobagscreen.dart';
import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/datilepage/detailescren.dart';
import 'package:ecomerce/provider/iteamcollectionprovider.dart';
import 'package:ecomerce/provider/wishlistprovider.dart' as wish;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Iteamcollections extends StatelessWidget {
  const Iteamcollections({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<IteamcollectionProvider>(context);

    final double itemWidth = (size.width - 55) / 2;
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
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: Icon(Icons.arrow_back_ios, color: Color(0xFFC34A5E)),
          ),
        ),
        title: const Text(
          "QUICK FASHION",
          style: TextStyle(
            color: ColorStyle.textPrimary,
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        actions: [
          const Icon(Icons.search, color: Color(0xFFC34A5E)),
          const SizedBox(width: 15),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addtobagscreen()),
              );
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFFC34A5E),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: ratio,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: provider.products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(context, provider, index);
        },
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    IteamcollectionProvider provider,
    int index,
  ) {
    final item = provider.products[index];

    // ✅ Wishlist Provider
    final wishlistProvider = Provider.of<wish.WishlistProvider>(context);
    final isFav = wishlistProvider.isFavorite(item.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      id: 'dress_001', // Unique ID khud se dein
                      image: 'assets/girl.png',
                      name: 'Sunset Silk Maxi Dress',
                      price: '310',
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  item.image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// ✅ FAVORITE BUTTON (FINAL)
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  wishlistProvider.toggleWishlist(
                    wish.Product(
                      id: item.id,
                      name: item.name,
                      price: item.price,
                      image: item.image,
                      brand: item.brand,
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    size: 16,
                    color: const Color(0xFFC34A5E),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Text(
          item.brand,
          style: const TextStyle(
            fontSize: 9,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          item.name,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4A3239),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          "₹${item.price}",
          style: const TextStyle(
            color: Color(0xFFC34A5E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
