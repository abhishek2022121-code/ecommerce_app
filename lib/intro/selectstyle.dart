import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/homemothod/homescreen.dart';
import 'package:ecomerce/intro/ageselect.dart';
import 'package:ecomerce/provider/selectstyleprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectStyleScreen extends StatelessWidget {
  const SelectStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<SelectStylesProvider>(context);

    final List<Map<String, dynamic>> items = [
      {"name": "Streetwear", "icon": Icons.shopping_bag},
      {"name": "Luxury", "icon": Icons.diamond_outlined},
      {"name": "Ethical Fashion", "icon": Icons.eco_outlined},
      {"name": "Accessories", "icon": Icons.watch_outlined},
      {"name": "Avant-Garde", "icon": Icons.auto_awesome_outlined},
      {"name": "Footwear", "icon": Icons.store},
      {"name": "Vintage", "icon": Icons.edit_outlined},
      {"name": "Minimalist", "icon": Icons.remove},
      {"name": "Activewear", "icon": Icons.fitness_center},
      {"name": "Runway", "icon": Icons.checkroom},
    ];

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
                MaterialPageRoute(builder: (context) => Homescreen()),
              );
            },
            child: const Text(
              "SKIP",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "CURATE YOUR FEED",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const Text(
              "TAILOR YOUR",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "FASHION PULSE",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Select at least three categories to build your personalized editorial stream. High-speed fashion starts here.",
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 35),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 16,
                  children: items.map((item) {
                    final isSelected = provider.selected.contains(item['name']);
                    return GestureDetector(
                      onTap: () => provider.toggle(item['name']),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.card.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              item['icon'],
                              size: 18,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textLight,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  //navigation is here where you want to go
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AgeSelectionScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Launch My Pulse",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: AppColors.white, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
