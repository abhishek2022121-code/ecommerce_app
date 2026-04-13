import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/bottomnave/navbaritems.dart';
import 'package:ecomerce/intro/ageselect.dart';
import 'package:ecomerce/l10n/app_localizations.dart';
import 'package:ecomerce/provider/selectstyleprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectStyleScreen extends StatelessWidget {
  const SelectStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<SelectStylesProvider>(context);
    // Localization instance
    final l10n = AppLocalizations.of(context)!;

    // Items list with localized names from your ARB keys
    final List<Map<String, dynamic>> items = [
      {"name": l10n.styleStreetwear, "icon": Icons.shopping_bag},
      {"name": l10n.styleLuxury, "icon": Icons.diamond_outlined},
      {"name": l10n.styleEthical, "icon": Icons.eco_outlined},
      {"name": l10n.styleAccessories, "icon": Icons.watch_outlined},
      {"name": l10n.styleAvantGarde, "icon": Icons.auto_awesome_outlined},
      {"name": l10n.styleFootwear, "icon": Icons.store},
      {"name": l10n.styleVintage, "icon": Icons.edit_outlined},
      {"name": l10n.styleMinimalist, "icon": Icons.remove},
      {"name": l10n.styleActivewear, "icon": Icons.fitness_center},
      {"name": l10n.styleRunway, "icon": Icons.checkroom},
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
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
        ),
        title: Text(
          l10n.appTitle, // "QUICK FASHION"
          style: const TextStyle(
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
                MaterialPageRoute(builder: (context) => const Navbaritems()),
              );
            },
            child: Text(
              l10n.btnSkip, // "SKIP"
              style: const TextStyle(
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
            Text(
              l10n.styleCurateLabel, // "CURATE YOUR FEED"
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            Text(
              l10n.styleTailorTitle, // "TAILOR YOUR"
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              l10n.stylePulseTitle, // "FASHION PULSE"
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              l10n.styleSubtitle, // "Select at least three categories..."
              style: const TextStyle(
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
                              style: const TextStyle(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AgeSelectionScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.btnLaunchPulse, // "Launch My Pulse"
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.white,
                      size: 20,
                    ),
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
