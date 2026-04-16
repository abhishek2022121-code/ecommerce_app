import 'package:ecomerce/colorce/appcolors.dart';
import 'package:flutter/material.dart';

class WomenScreen extends StatelessWidget {
  const WomenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: ColorStyle.scaffoldBg,

      // ================= APPBAR =================
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

      // ================= BODY =================
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HERO =================
            Container(
              height: height * 0.55,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/girl.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SUMMER ESSENTIALS '24",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: width * 0.03,
                      ),
                    ),
                    SizedBox(height: height * 0.01),

                    Text(
                      "THE NEW\nFEMININE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.09,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),

                    SizedBox(height: height * 0.015),

                    Text(
                      "Explore our latest collections that redefine contemporary elegance.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: width * 0.035,
                      ),
                    ),

                    SizedBox(height: height * 0.025),

                    Row(
                      children: [
                        _primaryButton("Shop All", width),
                        SizedBox(width: width * 0.04),
                        _outlineButton("View Runway", width),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ================= CATEGORY =================
            SizedBox(height: height * 0.02),

            SizedBox(
              height: height * 0.12,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                children: [
                  _categoryItem("Dresses", width),
                  _categoryItem("Tops", width),
                  _categoryItem("Shoes", width),
                  _categoryItem("Bags", width),
                  _categoryItem("Tops", width),
                  _categoryItem("Shoes", width),
                ],
              ),
            ),

            // ================= STYLIST PICKS =================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Stylist Picks",
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  Text(
                    "Curated trends from our\n editors",
                    style: TextStyle(color: ColorStyle.textSecondary),
                  ),

                  SizedBox(height: height * 0.02),

                  _productList(width),
                ],
              ),
            ),

            SizedBox(height: height * 0.03),

            // ================= PROMO =================
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Seasonal\nHighlights",
                    style: TextStyle(
                      fontSize: width * 0.075,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF4A2C2A),
                      height: 1.2,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.025),

                // Card
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: width * 0.011),
                  width: 350,
                  height: height * 0.43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    image: const DecorationImage(
                      image: AssetImage('assets/girl.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(width * 0.06),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.25),
                          Colors.black.withOpacity(0.45),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SUMMER\nESSENTIALS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.075,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),

                        SizedBox(height: height * 0.015),

                        Text(
                          "From breathable linens to ocean-\nready silhouettes. Up to 30% off\nselect seasonal styles.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: width * 0.033,
                            height: 1.4,
                          ),
                        ),

                        SizedBox(height: height * 0.02),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SHOP PROMO",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.038,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: width * 0.22,
                              height: 2,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: width * 0.011),
                  width: 350,
                  height: height * 0.43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    image: const DecorationImage(
                      image: AssetImage('assets/girl.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.05),
            collectionCard(width, height),
            // SizedBox(height: height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/girl.png",
                        height: height * 0.15,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(width: width * 0.03),

                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/girl.png",
                        height: height * 0.15,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }

  // ================= BUTTONS =================

  Widget _primaryButton(String text, double width) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: width * 0.025,
      ),
      decoration: BoxDecoration(
        gradient: ColorStyle.primaryGradient,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _outlineButton(String text, double width) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: width * 0.025,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  // ================= CATEGORY =================

  Widget _categoryItem(String title, double width) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.04),
      child: Column(
        children: [
          CircleAvatar(
            radius: width * 0.08,
            backgroundImage: const AssetImage('assets/girl.png'),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: width * 0.03,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // ================= PRODUCT LIST =================

  Widget _productList(double width) {
    return SizedBox(
      height: width * 0.75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            width: width * 0.45,
            margin: EdgeInsets.only(right: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image + Wishlist Icon
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/girl.png',
                        height: width * 0.55,
                        width: width * 0.45,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite_border,
                          size: 18,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: width * 0.02),

                Text(
                  "Linen Blend Blazer",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.035,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "\$245",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: width * 0.038,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget collectionCard(double width, double height) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      padding: EdgeInsets.all(width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ================= TAG =================
          const Text(
            "COLLECTION 01",
            style: TextStyle(
              fontSize: 12,
              color: ColorStyle.primary,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),

          SizedBox(height: height * 0.01),

          // ================= TITLE =================
          const Text(
            "The\nMonochromatic\n Set",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),

          SizedBox(height: height * 0.015),

          // ================= DESCRIPTION =================
          const Text(
            "A curated selection of tones that speak of quiet luxury. "
            "Discover the art of dressing in single hues with textures "
            "that provide the depth.",
            style: TextStyle(fontSize: 15, color: Colors.grey, height: 1.4),
          ),

          SizedBox(height: height * 0.02),

          // ================= CTA =================
          const Text(
            "Explore Collection →",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorStyle.primary,
            ),
          ),

          SizedBox(height: height * 0.03),

          // ================= IMAGE GRID =================
        ],
      ),
    );
  }
}
