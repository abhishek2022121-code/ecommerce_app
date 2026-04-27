import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:ecomerce/addtobag/addtobagscreen.dart';
import 'package:ecomerce/chechoutpage/checkoutscreen.dart';
import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/constomappbar/costomsearchappbar.dart';
import 'package:ecomerce/productlisting/iteamcollections.dart';
import 'package:ecomerce/provider/addtobagprovider.dart';
import 'package:ecomerce/provider/productdetaileprovider.dart';
import 'package:ecomerce/provider/wishlistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:ecomerce/colorce/appcolors.dart';

class ProductDetailScreen extends StatefulWidget {
  String image;
  String name;
  String price;
  String id;
  ProductDetailScreen({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentIndex = 0;
  bool isAddedToBag = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductDetailsProvider>(
        context,
        listen: false,
      ).resetQuantity();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<ProductDetailsProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F8),
      appBar: CustomSearchAppBar(
        title: 'QUICK FASHION',
        leadingWidget: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFC34A5E)),
          onPressed: () => Navigator.pop(context),
        ),
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
            // Main Product Image
            // CarouselSlider(
            //   items: List.generate(5, (index) {
            //     return AnimatedContainer(
            //       duration: Duration(milliseconds: 500),
            //       margin: EdgeInsets.symmetric(
            //         horizontal: 8,
            //         vertical: _currentIndex == index ? 10 : 20,
            //       ),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black26,
            //             blurRadius: 10,
            //             offset: Offset(0, 5),
            //           ),
            //         ],
            //         image: DecorationImage(
            //           image: AssetImage('assets/girl.png'),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     );
            //   }),
            //   options: CarouselOptions(
            //     height: 300,
            //     viewportFraction: 0.85,
            //     enlargeCenterPage: true,
            //     autoPlay: true,
            //     autoPlayInterval: Duration(seconds: 3),
            //     autoPlayAnimationDuration: Duration(milliseconds: 800),
            //     autoPlayCurve: Curves.easeInOut,
            //     onPageChanged: (index, reason) {
            //       setState(() {
            //         _currentIndex = index;
            //       });
            //     },
            //   ),
            // ),
            SizedBox(height: 30),
            Container(
              height: size.width,
              width: size.width,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(widget.image), // Main Bag Image
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
                  Text(
                    '${widget.name}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF4A3239),
                    ),
                  ),
                  Text(
                    '₹${widget.price}',
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
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutQuart,
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
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
      {"name": "Silk Mirage Scarf", "price": "₹145.00"},
      {"name": "Prism Gold Cuff", "price": "₹320.00"},
      {"name": "Aura Suede Heels", "price": "₹650.00"},
      {"name": "Atelier Trench", "price": "₹890.00"},
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
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Iteamcollections()),
            );
          },
          child: Column(
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
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
          ),
        );
      },
    );
  }

  Widget _buildBottomActionBar(
    BuildContext context,
    ProductDetailsProvider provider,
  ) {
    const primaryColor = Color(0xFF9E2A47);
    const lightPink = Color(0xFFFFF0F3);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
      ),
      child: Row(
        children: [
          // --- 1. Wishlist Button (Hamesha dikhega) ---
          _buildSquareIconButton(
            // 1. Icon check karne ke liye widget.id use karein
            icon: context.watch<WishlistProvider>().isFavorite(widget.id)
                ? Icons.favorite
                : Icons.favorite_border,
            color: primaryColor,
            onTap: () {
              final wishlistProvider = Provider.of<WishlistProvider>(
                context,
                listen: false,
              );

              // 2. Product object mein bhi id: widget.id hona chahiye
              final product = Product(
                id: widget.id,
                name: widget.name,
                price: widget.price,
                image: widget.image,
                brand: "Quick Fashion",
              );

              wishlistProvider.toggleWishlist(product);

              // 3. Status check (SnackBar ke liye) bhi id par karein
              final bool isAdded = wishlistProvider.isFavorite(widget.id);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isAdded ? "Added to Wishlist!" : "Removed from Wishlist",
                  ),
                  backgroundColor: isAdded
                      ? Colors.green.shade600
                      : Colors.red.shade600,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(milliseconds: 1500),
                ),
              );
            },
          ),
          const SizedBox(width: 12),

          // --- Conditional UI Logic ---
          if (!isAddedToBag) ...[
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isAddedToBag = true; // UI switch karne ke liye
                  });
                  // Bag mein add karne ka logic
                  Provider.of<AddtobagProvider>(context, listen: false).addItem(
                    widget.name,
                    widget.price,
                    widget.image,
                    provider.quantity,
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF9E2A47), Color(0xFFD65A74)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.shopping_bag_outlined, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "ADD TO BAG",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ] else ...[
            // Bag Icon Button
            _buildSquareIconButton(
              icon: Icons.shopping_bag_outlined,
              onTap: () {
                // final bag = Provider.of<AddtobagProvider>(
                //   context,
                //   listen: false,
                // );

                // bag.addItem(
                //   widget.name,
                //   widget.price,
                //   widget.image,
                //   provider.quantity,
                // );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Addtobagscreen(
                      // image: widget.image,
                      // name: widget.name,
                      // price: widget.price,
                      // quantity: provider.quantity,
                    ),
                  ),
                );
              },

              color: primaryColor,
            ),
            const SizedBox(width: 12),

            // 3. Quantity Stepper
            // 3. Quantity Stepper (Inside ProductDetailScreen)
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color:
                    lightPink, // Make sure lightPink is defined in your constants
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(
                      Icons.remove,
                      color: primaryColor,
                      size: 20,
                    ),
                    onPressed: () {
                      // Check: Sirf tabhi kam karo jab quantity 1 se zyada ho
                      if (provider.quantity > 1) {
                        // 1. Local quantity kam karo
                        provider.decrementQuantity();

                        // 2. Bag Provider mein sync karo
                        final bag = Provider.of<AddtobagProvider>(
                          context,
                          listen: false,
                        );
                        bag.updateQuantityByName(
                          widget.name,
                          provider.quantity,
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "${provider.quantity}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(Icons.add, color: primaryColor, size: 20),
                    onPressed: () {
                      // 1. Local quantity badhao
                      provider.incrementQuantity();

                      // 2. Bag Provider mein sync karo
                      final bag = Provider.of<AddtobagProvider>(
                        context,
                        listen: false,
                      );
                      bag.updateQuantityByName(widget.name, provider.quantity);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // 4. Buy Now Button
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Checkoutscreen()),
                  );
                  // // final bag = Provider.of<AddtobagProvider>(
                  // //   context,
                  // //   listen: false,
                  // // );

                  // // bag.addItem(
                  // //   widget.name,
                  // //   widget.price,
                  // //   widget.image,
                  // //   provider.quantity, // <--- Ye pass karein
                  // // );

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Addtobagscreen(
                  //       // image: widget.image,
                  //       // name: widget.name,
                  //       // price: widget.price,
                  //       // quantity: provider
                  //       //     .quantity, // <--- Screen constructor me bhi pass karein
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF9E2A47), Color(0xFFD65A74)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: Center(
                    child: const Text(
                      "BUY NOW",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
  //Helper for the square outline buttons

  Widget _buildSquareIconButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, color: color, size: 26),
      ),
    );
  }
}






//  Widget _buildBottomActionBar(
//     BuildContext context,
//     ProductDetailsProvider provider,
//   ) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
//       ),
//       child: Row(
//         children: [
//           // Favorite Icon
//           GestureDetector(
//             onTap: () => provider.toggleFavorite(),
//             child: Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 border: Border.all(color: const Color(0xFFC34A5E)),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 provider.isFavorite ? Icons.favorite : Icons.favorite_border,
//                 color: const Color(0xFFC34A5E),
//               ),
//             ),
//           ),
//           const SizedBox(width: 15),

//           Expanded(
//             child: InkWell(
//               onTap: () {
//                 final bag = Provider.of<AddtobagProvider>(
//                   context,
//                   listen: false,
//                 );

//                 bag.addItem(widget.name, widget.price, widget.image);

//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Addtobagscreen(
//                       image: widget.image,
//                       name: widget.name,
//                       price: widget.price,
//                     ),
//                   ),
//                 );
//               },
//               child: Container(
//                 height: 55, // Height thodi badhai for better UI
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFFC34A5E), Color(0xFFE47A8F)],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   ),
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFFC34A5E).withOpacity(0.3),
//                       blurRadius: 10,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.shopping_bag_outlined,
//                       color: Colors.white,
//                       size: 22,
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       "ADD TO BAG",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w900,
//                         fontSize: 16,
//                         letterSpacing: 1,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }