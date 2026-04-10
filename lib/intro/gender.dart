import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/homemothod/homescreen.dart';
import 'package:ecomerce/intro/longaugescreen.dart';
import 'package:ecomerce/provider/genderprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final genderProvider = Provider.of<GenderProvider>(context);

    const String femaleImageUrl = 'assets/girl.png'; // girl here
    const String maleImageUrl = 'assets/male.png'; //  boy here

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            // Step indicator
            Row(
              children: [
                Container(width: 30, height: 2, color: AppColors.primary),
                const SizedBox(width: 8),
                const Text(
                  "STEP 01",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Main Heading
            const Text(
              "WHO ARE WE\nSTYLING?",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 20),
            // Subtitle
            const Text(
              "Select your preference to curate a high-velocity fashion feed tailored to your aesthetic pulse.",
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 30),

            // Image Options Section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Female Image Option
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
                                image: AssetImage(
                                  femaleImageUrl,
                                ), /////////////////////////////female
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
                                  "CURATION",
                                  style: TextStyle(
                                    color: AppColors.primary.withOpacity(0.8),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const Text(
                                  "FEMALE",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.arrow_forward,
                              color: genderProvider.isFemaleSelected
                                  ? AppColors.white
                                  : AppColors.unselected,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Male Image Option
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
                                image: AssetImage(
                                  maleImageUrl,
                                ), //////////////male imageurl
                                fit: BoxFit.cover,
                                colorFilter: genderProvider.isMaleSelected
                                    ? null
                                    : const ColorFilter.mode(
                                        Colors.grey,
                                        BlendMode.saturation,
                                      ), // Grey out if not selected
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
                                  "CURATION",
                                  style: TextStyle(
                                    color: AppColors.primary.withOpacity(0.8),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const Text(
                                  "MALE",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.arrow_forward,
                              color: genderProvider.isMaleSelected
                                  ? AppColors.white
                                  : AppColors.unselected,
                              size: 28,
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

            // Bottom Section (Button and Dots)
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
                      boxShadow:
                          genderProvider.selectedGender != SelectedGender.none
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ]
                          : [],
                    ),
                    child: ElevatedButton(
                      onPressed:
                          genderProvider.selectedGender != SelectedGender.none
                          ? () {
                              ////////// navigate here
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LanguageSelectionScreen(),
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
                        "CONFIRM SELECTION",
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
                    "YOU CAN CHANGE THIS ANYTIME IN SETTINGS",
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 10,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 20),
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
