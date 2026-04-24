import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/intro/velocity.dart';
import 'package:ecomerce/l10n/app_localizations.dart';

import 'package:ecomerce/splashmothod/splashservices.dart';
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
    super.initState();

    // 2 sec splash delay
    Future.delayed(const Duration(seconds: 3), () {
      Splashservices().checkLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8F9FA), AppColors.white, Color(0xFFFCE4EC)],
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),

            Image(
              image: const AssetImage('assets/applogo.png'),
              height: size.width * 0.5,
              width: size.width * 0.5,
            ),

            const SizedBox(height: 50),

            Text(
              l10n.splashTheVelocity,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),

            Text(
              l10n.splashOfStyle,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),

            const Spacer(flex: 3),

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
