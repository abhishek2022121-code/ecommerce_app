import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/intro/selectstyle.dart';
import 'package:flutter/material.dart';

class Velocitypage extends StatelessWidget {
  const Velocitypage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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

                // Logo Circle
                // Container(
                //   height: size.width * 0.45,
                //   width: size.width * 0.45,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: const Color(0xFF2D3436),
                //     border: Border.all(color: AppColors.border, width: 2),
                //   ),
                //   child: Center(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         ///logo here adding///////////////////////////////////////
                //         const Icon(Icons.home, color: Colors.amber, size: 30),
                //         const Text(
                //           "QUICK",
                //           style: TextStyle(
                //             color: AppColors.white,
                //             fontSize: 24,
                //             fontWeight: FontWeight.bold,
                //             letterSpacing: 2,
                //           ),
                //         ),
                //         Text(
                //           "FASHION",
                //           style: TextStyle(
                //             color: AppColors.white.withOpacity(0.8),
                //             fontSize: 10,
                //             letterSpacing: 4,
                //           ),
                //         ),

                //         ///logo here adding///////////////////////////////////////
                //       ],
                //     ),
                //   ),
                // ),
                Image(
                  image: AssetImage('assets/applogo.png'),
                  height: size.width * 0.5,
                  width: size.width * 0.5,
                ),

                SizedBox(height: size.height * 0.08),

                // Headline
                const Text(
                  "THE VELOCITY",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  "OF STYLE",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // Subtitle
                Text(
                  "High-speed curation for the modern vanguard. Experience the digital pulse of fashion.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                      ///f you want to navite , use this poit
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectStyleScreen(),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ENTER THE RUNWAY",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
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
                  "MEMBER EXCLUSIVE",
                  style: TextStyle(
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
                      onPressed: () {}, ////// signin mathod here
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Text("•", style: TextStyle(color: AppColors.border)),
                    TextButton(
                      onPressed: () {}, ////club join here ////////////////////
                      child: const Text(
                        "JOIN THE CLUB",
                        style: TextStyle(
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
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.verified_outlined,
                        color: Color(0xFF00796B),
                        size: 14,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "CERTIFIED SUSTAINABLE PARTNERS",
                        style: TextStyle(
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
