import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/intro/selectstyle.dart';
import 'package:ecomerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
// 1. Localization import karein

class Velocitypage extends StatelessWidget {
  const Velocitypage({super.key});

  // 2. Getter define karein (bina context parameter ke, as a member)
  // Note: StatelessWidget mein context access karne ke liye AppLocalizations.of(context) seedhe build mein likhna behtar hota hai.

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // 3. Build ke andar instance le lein
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.white, Color(0xFFFCE4EC), AppColors.white],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.1),

                Image(
                  image: const AssetImage('assets/applogo.png'),
                  height: size.width * 0.5,
                  width: size.width * 0.5,
                ),

                SizedBox(height: size.height * 0.08),

                // Headline
                Text(
                  l10n.splashTheVelocity, // Localized
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  l10n.splashOfStyle, // Localized
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // Subtitle
                Text(
                  l10n.velocitySubtitle, // Localized
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),

                const Spacer(),

                // Main Button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectStyleScreen(),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.btnEnterRunway, // Localized
                          style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                // Member Options
                Text(
                  l10n.labelMemberExclusive, // Localized
                  style: const TextStyle(
                    color: AppColors.textLight,
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        l10n.btnSignIn, // Localized
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Text("•", style: TextStyle(color: AppColors.border)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        l10n.btnJoinClub, // Localized
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                // Pagination Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 2,
                      width: 20,
                      color: index == 0 ? AppColors.primary : AppColors.border,
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                // Bottom Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.verified_outlined,
                        color: Color(0xFF00796B),
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        l10n.labelSustainable, // Localized
                        style: const TextStyle(
                          color: Color(0xFF00796B),
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
