import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/bottomnave/navbaritems.dart';
import 'package:ecomerce/intro/ageselect.dart';
import 'package:ecomerce/intro/longaugescreen.dart';
import 'package:ecomerce/l10n/app_localizations.dart';
import 'package:ecomerce/provider/genderprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final genderProvider = Provider.of<GenderProvider>(context);
    // 2. Localization instance
    final l10n = AppLocalizations.of(context)!;

    const String femaleImageUrl = 'assets/girl.png';
    const String maleImageUrl = 'assets/male.png';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 4.0,

        shadowColor: AppColors.black.withOpacity(0.3),
        // elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
        ),
        title: Text(
          l10n.genderStep,
          style: const TextStyle(
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
                MaterialPageRoute(builder: (context) => const Navbaritems()),
              );
            },
            child: Text(
              l10n.btnSkip,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Container(width: 30, height: 2, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  l10n.btnSkip, // Localized "STEP 01"
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              l10n.genderHeading, // Localized "WHO ARE WE STYLING?"
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.genderSubtitle, // Localized description
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 30),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Female Option
                    GestureDetector(
                      onTap: () =>
                          genderProvider.selectGender(SelectedGender.female),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            height: size.height * 0.45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: const AssetImage(femaleImageUrl),
                                fit: BoxFit.cover,
                                colorFilter: genderProvider.isFemaleSelected
                                    ? null
                                    : const ColorFilter.mode(
                                        Colors.grey,
                                        BlendMode.saturation,
                                      ),
                              ),
                              border: Border.all(
                                color: genderProvider.isFemaleSelected
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  l10n.labelCuration, // Localized "CURATION"
                                  style: TextStyle(
                                    color: AppColors.primary.withOpacity(0.8),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  l10n.genderFemale, // Localized "FEMALE"
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Male Option
                    GestureDetector(
                      onTap: () =>
                          genderProvider.selectGender(SelectedGender.male),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            height: size.height * 0.45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: const AssetImage(maleImageUrl),
                                fit: BoxFit.cover,
                                colorFilter: genderProvider.isMaleSelected
                                    ? null
                                    : const ColorFilter.mode(
                                        Colors.grey,
                                        BlendMode.saturation,
                                      ),
                              ),
                              border: Border.all(
                                color: genderProvider.isMaleSelected
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  l10n.labelCuration, // Localized "CURATION"
                                  style: TextStyle(
                                    color: AppColors.primary.withOpacity(0.8),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  l10n.genderMale, // Localized "MALE"
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // Bottom Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      gradient:
                          genderProvider.selectedGender != SelectedGender.none
                          ? AppColors.primaryGradient
                          : null,
                      color:
                          genderProvider.selectedGender == SelectedGender.none
                          ? AppColors.divider
                          : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed:
                          genderProvider.selectedGender != SelectedGender.none
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AgeSelectionScreen(),
                                  //LanguageSelectionScreen(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        l10n.btnConfirmSelection, // Localized "CONFIRM SELECTION"
                        style: TextStyle(
                          color:
                              genderProvider.selectedGender !=
                                  SelectedGender.none
                              ? AppColors.white
                              : AppColors.textLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    l10n.genderChangeNote, // Localized "YOU CAN CHANGE THIS ANYTIME..."
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 10,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 20, height: 2, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Container(width: 20, height: 2, color: AppColors.divider),
                      const SizedBox(width: 4),
                      Container(width: 20, height: 2, color: AppColors.divider),
                    ],
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
