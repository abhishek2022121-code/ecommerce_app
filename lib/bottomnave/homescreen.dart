import 'package:ecomerce/addtobag/addtobagscreen.dart';
import 'package:ecomerce/datilepage/detailescren.dart';
import 'package:ecomerce/productlisting/iteamcollections.dart';
import 'package:ecomerce/productlisting/womenscreen.dart';
import 'package:ecomerce/provider/wishlistprovider.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce/colorce/appcolors.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double hp = size.width * 0.05;
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF7F8),
        elevation: 4.0,
        shadowColor: Colors.black.withOpacity(0.3),
        centerTitle: true,

        leading: isSearching
            ? IconButton(
                icon: const Icon(Icons.close, color: Color(0xFFC34A5E)),
                onPressed: () {
                  setState(() {
                    isSearching = false;
                    _searchController.clear();
                  });
                },
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/applogo.png'),
              ),
        title: isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: const TextStyle(color: Color(0xFF4A3239)),
                decoration: const InputDecoration(
                  hintText: "Search items...",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              )
            : const Text(
                "QUICK FASHION",
                style: TextStyle(
                  color: Color(0xFF4A3239),
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),

        actions: [
          if (!isSearching)
            IconButton(
              icon: const Icon(Icons.search, color: Color(0xFFC34A5E)),
              onPressed: () {
                setState(() {
                  isSearching = true;
                });
              },
            ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addtobagscreen()),
              );
            },
            icon: Icon(Icons.shopping_bag_outlined, color: Color(0xFFC34A5E)),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //offer container
            _buildHeroBanner(size, hp),
            _buildCurationHeader(),
            //story secsion
            _buildCurationStories(hp),

            //text and view all part
            _buildSectionHeader("BRAND OF THE DAY", hp, action: "VIEW ALL"),
            //h&m container
            _buildBrandGrid(size, hp),
            // gucci: the renaissance
            _buildGucciSpotlight(size, hp),

            // 5. Best of Quick Fashion (Horizontal)
            _buildSectionHeader(
              "BEST OF QUICK\n FASHION",
              hp,
              action: "SHOP NOW",
            ),
            _buildProductList(size),

            //new arrivals and drop
            _buildSectionHeader("NEW ARRIVALS", hp, action: "DROP #1"),
            _buildNewArrivalCard(
              size,
              hp,
              "THE SILK CAPSULE",
              "SUSTAINABLE LUXE",
            ),
            _buildNewArrivalCard(size, hp, "PREMIUM BASICS", "MINIMALIST EDIT"),

            // 7. Newsletter Section (The Pinkish Block)
            _buildNewsletter(hp),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // --- UI COMPONENTS ---
  Widget _buildSectionHeader(String title, double hp, {String? action}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(hp, 15, hp, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
              letterSpacing: -0.5,
            ),
          ),
          if (action != null)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Iteamcollections()),
                );
              },
              child: Text(
                action,
                style: const TextStyle(
                  color: ColorStyle.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCurationHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
        children: const [
          Text(
            "Curation by Style",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A3239), // Deep plum color
              letterSpacing: -0.5,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Discover what defines you",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF8E737B), // Muted mauve/brown color
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurationStories(double hp) {
    final List<String> cats = ["MEN", "WOMEN", "KIDS", "BEAUTY"];
    return Container(
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: hp),
        itemCount: cats.length,
        itemBuilder: (context, i) => Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WomenScreen()),
              );
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorStyle.primary, width: 1.5),
                  ),
                  child: const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("assets/girl.png"),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  cats[i],
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroBanner(Size size, double hp) {
    return Container(
      height: size.height * 0.35,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: hp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: AssetImage("assets/girl.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SEASONAL EXCLUSIVE",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const Text(
              "END OF\nREASON\nSALE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.w900,
                height: 0.9,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _pillButton("50-80% OFF", Colors.white, ColorStyle.primary),
                const SizedBox(width: 20),
                const Text(
                  "SHOP NOW",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandGrid(Size size, double hp) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hp),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addtobagscreen()),
              );
            },
            child: _brandCard(
              size,
              "H&M ESSENTIALS",
              "URBAN LEGEND",
              height: 280,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Addtobagscreen()),
                    );
                  },
                  child: _brandCard(
                    size,
                    "NIKE AIR",
                    "",
                    height: 180,
                    small: true,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Addtobagscreen()),
                    );
                  },
                  child: _brandCard(
                    size,
                    "ADIDAS ORIG",
                    "",
                    height: 180,
                    small: true,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Addtobagscreen()),
                    );
                  },
                  child: _brandCard(
                    size,
                    "ZARA MAN",
                    "",
                    height: 180,
                    small: true,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Addtobagscreen()),
                    );
                  },
                  child: _brandCard(
                    size,
                    "FOREVER 21",
                    "",
                    height: 180,
                    small: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGucciSpotlight(Size size, double hp) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: hp, vertical: 20),
      padding: const EdgeInsets.symmetric(vertical: 30), // Top/Bottom padding
      decoration: BoxDecoration(
        // Light pinkish background as seen in the screenshot
        color: const Color(0xFFFDF0F3),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Content Padding
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "SPOTLIGHT ON",
                  style: TextStyle(
                    color: Color(0xFFD32F2F), // Darker shade for 'Spotlight'
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "GUCCI: THE\nRENAISSANCE",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    height: 1.0,
                    color: Color(0xFF33232D), // Deep brown/purple text
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Explore the latest collection\n that blends Italian\n craftsmanship with modern\n street surrealism.",
                  style: TextStyle(
                    color: Color(0xFF7D6E77),
                    height: 1.4,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 25),

                // Buttons Row
                Row(
                  children: [
                    // Dark Pill Button
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF422734),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        "EXPLORE\nBRAND",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    // Text Button with underline
                    Column(
                      children: [
                        const Text(
                          "VIEW\nCOLLECTION",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFD32F2F),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          height: 2,
                          width: 60,
                          color: const Color(0xFFD32F2F),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Image with specific border radius from screenshot
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hp * 0.5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Addtobagscreen()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/girl.png", // Replace with your image
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewArrivalCard(Size size, double hp, String title, String sub) {
    return Container(
      // Pure card ka background color screenshot jaisa rakha hai
      color: const Color(0xFFFDF0F3),
      padding: EdgeInsets.symmetric(horizontal: hp, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container with Stack
          ClipRRect(
            borderRadius: BorderRadius.circular(
              30,
            ), // Extra rounded as per image
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Addtobagscreen()),
                );
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Image.asset(
                    "assets/girl.png",
                    height:
                        420, // Height image ke proportion ke hisaab se set ki hai
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Floating Action Button (+ Icon)
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Container(
                  //     height: 50,
                  //     width: 50,
                  //     decoration: const BoxDecoration(
                  //       color: Color(
                  //         0xFFA6264C,
                  //       ), // Screenshot ka exact maroonish-pink color
                  //       shape: BoxShape.circle,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black26,
                  //           blurRadius: 10,
                  //           offset: Offset(0, 4),
                  //         ),
                  //       ],
                  //     ),
                  //     child: const Icon(Icons.add, color: Colors.white, size: 28),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Subtitle (e.g., SUSTAINABLE LUXE)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sub.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFFA6264C), // Same color as the + button
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Title (e.g., THE SILK CAPSULE)
                  Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF33232D), // Deep dark brown text
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Color(
                      0xFFA6264C,
                    ), // Screenshot ka exact maroonish-pink color
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 28),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildNewsletter(double hp) {
    return Container(
      margin: EdgeInsets.all(hp),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      decoration: BoxDecoration(
        // A soft pinkish background
        color: const Color(0xFFFDE4E9),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Main Heading
          const Text(
            "JOIN THE QUICK\nFASHION NOW !!!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Color(0xFF4A3239), // Dark brown/plum text
              height: 1.2,
            ),
          ),
          const SizedBox(height: 15),

          // Body Description
          const Text(
            "Subscribe to receive early access to collection drops, exclusive editorial content, and special event invites.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF4A3239),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 30),

          // Email Input Field
          TextField(
            decoration: InputDecoration(
              hintText: "Your email address",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), // Pill-shaped
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A3239), // Dark button color
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Pill-shaped
                ),
                elevation: 0,
              ),
              child: const Text(
                "SIGNIN NOW",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- HELPERS ---
  Widget _brandCard(
    Size size,
    String title,
    String sub, {
    required double height,
    bool small = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Addtobagscreen()),
        );
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage("assets/girl.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (sub.isNotEmpty)
              Text(
                sub,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            small
                ? Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _pillButton(String text, Color bg, Color txt) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(color: txt, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _rectButton(
    String text,
    Color bg,
    Color txt, {
    bool border = false,
    bool fullWidth = false,
  }) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: border
            ? Border.all(
                color: bg == Colors.transparent
                    ? ColorStyle.textPrimary
                    : Colors.transparent,
              )
            : null,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: txt, fontWeight: FontWeight.bold, fontSize: 11),
      ),
    );
  }

  Widget _buildProductList(Size size) {
    return SizedBox(
      height: 300, // Thoda height badha diya taaki text cut na ho
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        itemCount: 4,
        itemBuilder: (context, i) {
          final product = Product(
            id: "product_$i", // Har item ki unique ID honi chahiye
            name: "Pure Linen Shirt",
            price: "1,299",
            brand: "ROADSTER",
            image: "assets/girl.png",
          );

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailScreen()),
              );
            },
            child: Container(
              width: 180,
              margin: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          product.image,
                          height: 200,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // 2. Favorite Icon Logic with Consumer
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Consumer<WishlistProvider>(
                          builder: (context, provider, child) {
                            bool isFav = provider.isFavorite(product.id);
                            return GestureDetector(
                              onTap: () {
                                provider.toggleWishlist(product);
                                // Optional: Chhota sa feedback
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isFav
                                          ? "Removed from Wishlist"
                                          : "Added to Wishlist",
                                    ),
                                    duration: const Duration(milliseconds: 500),
                                    backgroundColor: AppColors.primary,
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white.withOpacity(0.8),
                                child: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFav
                                      ? AppColors.error
                                      : AppColors.black,
                                  size: 20,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.brand,
                    style: const TextStyle(
                      fontSize: 10,
                      color: ColorStyle.textLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorStyle.textPrimary,
                    ),
                  ),
                  Text(
                    "₹${product.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
