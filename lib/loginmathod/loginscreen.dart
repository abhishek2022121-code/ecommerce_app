import 'package:ecomerce/bottomnave/navbaritems.dart';
import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/l10n/app_localizations.dart';
import 'package:ecomerce/loginmathod/signupscreen.dart';
import 'package:ecomerce/provider/loginprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.appTitle,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w900,
            fontSize: 16,
            letterSpacing: 1,
          ),
        ),
        actions: [
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
                  SizedBox(height: size.height * 0.04),
                  Text(
                    l10n.loginHeading, // "LOGIN"
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.loginSubtitle, // "Access your curated style dashboard."
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),

                  // Email Input
                  Text(
                    l10n.labelEmail, // "EMAIL ADDRESS"
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildInputField(
                    loginProvider.emailController,
                    l10n.hintEmail, // "name@style.com"
                    false,
                  ),

                  SizedBox(height: size.height * 0.03),

                  // Password Input
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Alignment fixed
                    children: [
                      Text(
                        l10n.labelPassword, // "PASSWORD"
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          l10n.btnForgotPass, // "FORGOT PASSWORD?"
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildInputField(
                    loginProvider.passwordController,
                    l10n.hintPassword, // "••••••••"
                    true,
                  ),

                  SizedBox(height: size.height * 0.04),

                  // Sign In Button
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        final email = loginProvider.emailController.text.trim();
                        final password = loginProvider.passwordController.text
                            .trim();

                        if (email.isNotEmpty && password.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("login successfuly"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Navbaritems(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill all fields"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: loginProvider.isLoading
                          ? const CircularProgressIndicator(
                              color: AppColors.white,
                            )
                          : Text(
                              l10n.btnSignIn, // "SIGN IN"
                              style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.04),

                  // Or Continue With
                  Row(
                    children: [
                      const Expanded(child: Divider(color: AppColors.divider)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          l10n.labelOrContinue, // "OR CONTINUE WITH"
                          style: const TextStyle(
                            color: AppColors.textLight,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider(color: AppColors.divider)),
                    ],
                  ),

                  SizedBox(height: size.height * 0.04),

                  // Social Buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildSocialButton(l10n.btnGoogle),
                      ), // "GOOGLE"
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildSocialButton(l10n.btnApple),
                      ), // "iOS"
                    ],
                  ),

                  SizedBox(height: size.height * 0.05),

                  // Footer Link
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupMethodScreen(),
                        ),
                      );
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: l10n.footerNewTo,
                            ), // "New to Quick Fashion? "
                            TextSpan(
                              text:
                                  l10n.footerCreateAccount, // "Create Account"
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),

            // Bottom Banner Image
            Stack(
              children: [
                Container(
                  height: size.height * 0.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/girl.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    l10n.bannerEdition, // "SPRING / SUMMER EDITION..."
                    style: TextStyle(
                      color: AppColors.textPrimary.withOpacity(0.6),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  right: 20,
                  child: Row(
                    children: [
                      Container(width: 30, height: 2, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Container(width: 10, height: 2, color: AppColors.divider),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    TextEditingController controller,
    String hint,
    bool isObscure,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scaffoldBg.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.unselected, fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String label) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.scaffoldBg.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w900,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
