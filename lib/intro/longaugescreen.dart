import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/bottomnave/navbaritems.dart';
import 'package:ecomerce/constomappbar/costomloginappbar.dart';
import 'package:ecomerce/intro/gender.dart';
import 'package:ecomerce/l10n/app_localizations.dart';
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

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: CustomLoginAppBar(
        leadingIcon: const Icon(Icons.close, color: AppColors.textPrimary),
        title: l10n.appTitle,
        onLeadingPressed: () => Navigator.pop(context),
        customActions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Navbaritems()),
              );
            },
            child: Text(
              l10n.btnSkip, // Localized
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    l10n.langSelection, // Localized
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.langChooseTitle, // Localized
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    l10n.langDialect, // Localized
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    l10n.langSubtitle, // Localized
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Language Cards

                  // Row 1 (English & Hindi)
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: _LanguageCard(
                          title: l10n.langEnglishTitle,
                          subTitle: l10n.langEnglishSub,
                          langCode: "EN",
                          isSelected: langProvider.locale.languageCode == 'en',
                          onTap: () => langProvider.setLanguage("en"),
                        ),
                      ),
                      // const SizedBox(width: 56),
                      Expanded(
                        child: _LanguageCard(
                          title: l10n.langHindiTitle,
                          subTitle: l10n.langHindiSub,
                          langCode: "HI",
                          isSelected: langProvider.locale.languageCode == 'hi',
                          onTap: () => langProvider.setLanguage("hi"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Row 2 (Punjabi & Gujarati)
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: _LanguageCard(
                          title: "ਪੰਜਾਬੀ",
                          subTitle: "PUNJABI",
                          langCode: "PA",
                          isSelected: langProvider.locale.languageCode == 'pa',
                          onTap: () => langProvider.setLanguage("pa"),
                        ),
                      ),
                      // const SizedBox(width: 56),
                      Expanded(
                        child: _LanguageCard(
                          title: "ગુજરાતી",
                          subTitle: "GUJARATI",
                          langCode: "GU",
                          isSelected: langProvider.locale.languageCode == 'gu',
                          onTap: () => langProvider.setLanguage("gu"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Row 3 (Marathi & Tamil)
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: _LanguageCard(
                          title: "मराठी",
                          subTitle: "MARATHI",
                          langCode: "MR",
                          isSelected: langProvider.locale.languageCode == 'mr',
                          onTap: () => langProvider.setLanguage("mr"),
                        ),
                      ),
                      //const SizedBox(width: 56),
                      Expanded(
                        child: _LanguageCard(
                          title: "தமிழ்",
                          subTitle: "TAMIL",
                          langCode: "TA",
                          isSelected: langProvider.locale.languageCode == 'ta',
                          onTap: () => langProvider.setLanguage("ta"),
                        ),
                      ),
                    ],
                  ),
                  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ],
              ),
            ),
            //   const Spacer(),
            SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height * 0.35,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/girl.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(color: Colors.black.withOpacity(0.4)),
                ),
                Column(
                  children: [
                    Text(
                      l10n.langVelocityStyle, // Localized
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectGender(),
                              //SignupMethodScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(),
                        ),
                        child: Text(
                          l10n.btnConfirmSelection, // Localized
                          style: const TextStyle(
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
            Center(
              child: Text(
                l10n.langFooter, // Localized
                style: const TextStyle(
                  color: AppColors.textLight,
                  fontSize: 9,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
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
      ),
    );
  }
}

// Language Card Widget remains same but with dynamic colors based on selection
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
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            //mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Column(
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
              // Positioned(
              //   top: 10,
              //   right: 10,
              //   child: Icon(
              //     Icons.check_circle,
              //     size: 20,
              //     color: isSelected ? AppColors.primary : Colors.transparent,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
