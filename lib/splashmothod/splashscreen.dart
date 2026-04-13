import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/intro/velocity.dart';
import 'package:ecomerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  AppLocalizations get l10n => AppLocalizations.of(context)!;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Velocitypage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Screen dimensions for responsiveness
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // Soft radial or linear gradient as seen in the background
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8F9FA),
              AppColors.white,
              Color(0xFFFCE4EC), // Very light pink at the bottom
            ],
          ),
        ),
        child: Column(
          children: [
            // Top section for spacing and cart icon
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 25, top: 20),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.black.withOpacity(0.7),
                    size: 28,
                  ),
                ),
              ),
            ),

            const Spacer(flex: 2),

            // Central Logo Widget
            // Container(
            //   height: size.width * 0.5,
            //   width: size.width * 0.5,
            //   padding: const EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       color: AppColors.divider.withOpacity(0.5),
            //       width: 1,
            //     ),
            //     color: const Color(0xFF2D3436), // Dark background for the logo
            //   ),
            //   child: Center(
            //     child: Image.asset(
            //       'assets/images/quick_fashion_logo.png', // Logo placeholder
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),
            Image(
              image: AssetImage('assets/applogo.png'),
              height: size.width * 0.5,
              width: size.width * 0.5,
            ),
            const SizedBox(height: 50),

            // Typography Section
            Text(
              l10n.splashTheVelocity,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              l10n.splashOfStyle,
              style: const TextStyle(
                color: AppColors.primary, // Using your magenta/pink color
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),

            const Spacer(flex: 3),

            // Bottom decorative line
            Container(
              width: 60,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
