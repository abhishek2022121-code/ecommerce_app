import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/homemothod/homescreen.dart';
import 'package:ecomerce/intro/gender.dart';
import 'package:ecomerce/provider/ageselectprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgeSelectionScreen extends StatelessWidget {
  const AgeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<AgeSelectProvider>(context);

    // Age brackets data
    final List<Map<String, String>> ageBrackets = [
      {"label": "GEN Z\nNEXT", "range": "0-18"},
      {"label": "PEAK\nKINETIC", "range": "19-24"},
      {"label": "EDITORIAL\nMILLENNIAL", "range": "25-40"},
      {"label": "TIMELESS\nAUTHORITY", "range": "40+"},
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
        ),
        title: const Text(
          "QUICK FASHION",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w900,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Homescreen()),
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
      // SafeArea notch aur bottom bars se bachata hai
      body: SafeArea(
        // SingleChildScrollView overflow error ko fix karta hai
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textPrimary,
                    ),
                    children: [
                      TextSpan(text: "Tailor your "),
                      TextSpan(
                        text: "Pulse.",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Our editorial engine curates trends based on your generation's velocity. Select your bracket.",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 30),

                // Age Brackets List
                ...ageBrackets.map((bracket) {
                  bool isSelected =
                      provider.selectedBracket == bracket['range'];
                  return GestureDetector(
                    onTap: () => provider.selectBracket(bracket['range']!),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.border.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bracket['label']!,
                                  style: TextStyle(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.textLight,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  bracket['range']!,
                                  style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.radio_button_off,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.border,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),

                const SizedBox(height: 10),

                // Verified Choice Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.card.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "VERIFIED CHOICE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Over 2.4M fashionistas use these demographics to fuel their personal feed daily.",
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.pets,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),

                // Spacer() ki jagah fixed SizedBox scrollview mein zaroori hai
                const SizedBox(height: 40),

                // Confirm Button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectGender(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "CONFIRM SELECTION",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Pagination indicators
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 2,
                        width: 20,
                        color: index == 1
                            ? AppColors.primary
                            : AppColors.border,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Bottom safe space
              ],
            ),
          ),
        ),
      ),
    );
  }
}
