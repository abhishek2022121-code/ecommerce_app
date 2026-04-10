import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/homemothod/homescreen.dart';
import 'package:ecomerce/loginmathod/signupscreen.dart';
import 'package:ecomerce/provider/longuageprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final langProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: AppColors.textPrimary),
        ),
        title: const Text(
          "QUICK FASHION",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Homescreen()),
              );
            },
            child: const Text(
              "SKIP",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "SELECTION",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Choose your",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Dialect.",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Experience fashion in the language that resonates with your personal style.",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 40),

                // Language Cards
                Row(
                  children: [
                    // English Card
                    Expanded(
                      child: _LanguageCard(
                        title: "English",
                        subTitle: "GLOBAL STANDARD",
                        langCode: "EN",
                        isSelected: langProvider.isSelected("English"),
                        onTap: () => langProvider.setLanguage("English"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Hindi Card
                    Expanded(
                      child: _LanguageCard(
                        title: "हिन्दी",
                        subTitle: "HINDI",
                        langCode: "HI",
                        isSelected: langProvider.isSelected("हिन्दी"),
                        onTap: () => langProvider.setLanguage("हिन्दी"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),

          // Center Banner with Image and Button
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height * 0.35,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/girl.png',
                    ), // Replace with AI image
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.4), // Dark overlay
                ),
              ),
              Column(
                children: [
                  const Text(
                    "VELOCITY &\nSTYLE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: size.width * 0.7,
                    height: 55,
                    decoration: const BoxDecoration(
                      gradient: AppColors.primaryGradient,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        //////////navigator here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupMethodScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: const Text(
                        "CONFIRM SELECTION",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),
          // Footer
          const Center(
            child: Text(
              "QUICK FASHION © 2024 • EDITORIAL LANGUAGE INTERFACE V2.0",
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: 9,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Pagination Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 20, height: 2, color: AppColors.divider),
              const SizedBox(width: 4),
              Container(width: 20, height: 2, color: AppColors.primary),
              const SizedBox(width: 4),
              Container(width: 20, height: 2, color: AppColors.divider),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String langCode;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageCard({
    required this.title,
    required this.subTitle,
    required this.langCode,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : AppColors.card.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Stack(
          children: [
            if (isSelected)
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    langCode,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textLight,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
