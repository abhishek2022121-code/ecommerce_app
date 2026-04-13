import 'package:flutter/material.dart';
import 'package:ecomerce/colorce/appcolors.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hp = size.width * 0.05;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  _buildStories(size),
            _buildHero(size, hp),

            _sectionTitle("CURATION BY STYLE", hp),
            // Text('Discover what defines you'),
            _buildCategories(size),

            _sectionTitle("BRAND OF THE DAY", hp),
            _buildBrandCard(size, hp),

            const SizedBox(height: 10),
            _buildMiniGrid(hp),

            _buildSpotlight(size, hp),

            _sectionTitle("BEST OF QUICK FASHION", hp, action: true),
            _buildProducts(size),

            _sectionTitle("NEW ARRIVALS", hp, action: true),
            _buildBigCards(size, hp),

            _buildNewsletter(size, hp),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ---------------- UI ----------------

  Widget _buildStories(Size size) {
    final items = ["MEN", "WOMEN", "KIDS", "BEAUTY"];

    return SizedBox(
      height: size.height * 0.13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: items.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Column(
              children: [
                CircleAvatar(
                  radius: size.width * 0.07,
                  backgroundImage: const AssetImage("assets/girl.png"),
                ),
                const SizedBox(height: 6),
                Text(
                  items[i],
                  style: TextStyle(
                    fontSize: size.width * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHero(Size size, double hp) {
    return Container(
      height: size.height * 0.28,
      margin: EdgeInsets.symmetric(horizontal: hp, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('assets/girl.png'),
          fit: BoxFit.cover,
        ),
        // gradient: AppColors.primaryGradient,
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SEASONAL EXCLUSIVE",
              style: TextStyle(
                color: Colors.white70,
                fontSize: size.width * 0.025,
              ),
            ),
            const Spacer(),
            Text(
              "END OF\nSEASON SALE",
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("60-80%"),
                ),
                const SizedBox(width: 10),
                const Text("SHOP NOW →", style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
          (index) => Column(
            children: [
              CircleAvatar(
                radius: size.width * 0.06,
                backgroundImage: const AssetImage("assets/girl.png"),
              ),
              const SizedBox(height: 6),
              const Text("MEN", style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandCard(Size size, double hp) {
    return Container(
      height: size.height * 0.25,
      margin: EdgeInsets.symmetric(horizontal: hp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: const DecorationImage(
          image: AssetImage("assets/girl.png"),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(15),
      child: const Text(
        "H&M ESSENTIALS",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMiniGrid(double hp) {
    return GridView.count(
      padding: EdgeInsets.all(hp),
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(
        4,
        (index) => ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset("assets/girl.png", fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildSpotlight(Size size, double hp) {
    return Padding(
      padding: EdgeInsets.all(hp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "SPOTLIGHT ON",
            style: TextStyle(color: AppColors.primary),
          ),
          const SizedBox(height: 8),
          const Text(
            "GUCCI: THE RENAISSANCE",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text("Explore the latest collection..."),
          const SizedBox(height: 10),
          Row(
            children: [
              _btn("EXPLORE", true),
              const SizedBox(width: 10),
              _btn("VIEW", false),
            ],
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset("assets/girl.png"),
          ),
        ],
      ),
    );
  }

  Widget _buildProducts(Size size) {
    return SizedBox(
      height: size.height * 0.28,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        itemCount: 3,
        itemBuilder: (_, i) => Container(
          width: size.width * 0.4,
          margin: const EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/girl.png",
                  height: size.height * 0.18,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Pure Linen Shirt",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text("₹1,299"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBigCards(Size size, double hp) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hp),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/girl.png"),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/girl.png"),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsletter(Size size, double hp) {
    return Container(
      margin: EdgeInsets.all(hp),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8E6EC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            "JOIN THE QUICK FASHION NOW !!!",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: "Your email",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {},
            child: const Text("SIGN IN"),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text, double hp, {bool action = false}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(hp, 20, hp, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          if (action)
            const Text(
              "SHOP NOW",
              style: TextStyle(color: AppColors.primary, fontSize: 12),
            ),
        ],
      ),
    );
  }

  Widget _btn(String text, bool filled) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: filled ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: filled ? null : Border.all(color: AppColors.primary),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: filled ? Colors.white : AppColors.primary,
          fontSize: 12,
        ),
      ),
    );
  }
}
