import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/homemothod/homescreen.dart';
import 'package:ecomerce/loginmathod/loginscreen.dart';
import 'package:ecomerce/provider/signupprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupMethodScreen extends StatelessWidget {
  const SignupMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<SignProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "QUICK FASHION",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w900,
            fontSize: 16,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Form(
            key: provider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.03),
                const Text(
                  "CREATE",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
                const Text(
                  "ACCOUNT",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                const Text(
                  "Join the global avant-garde. Instant access to limited drops and high-velocity style updates.",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: size.height * 0.05),

                // Full Name
                _buildFieldTitle("FULL NAME"),
                TextFormField(
                  controller: provider.nameController,
                  validator: provider.validateName,
                  decoration: _inputDecoration("ALEXANDER MCQUEEN"),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),

                // Email Address
                _buildFieldTitle("EMAIL ADDRESS"),
                TextFormField(
                  controller: provider.emailController,
                  validator: provider.validateEmail,
                  decoration: _inputDecoration("alex@fashion.com"),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),

                // Password
                _buildFieldTitle("PASSWORD"),
                TextFormField(
                  controller: provider.passwordController,
                  validator: provider.validatePassword,
                  obscureText: true,
                  decoration: _inputDecoration("••••••••••••"),
                ),
                SizedBox(height: size.height * 0.03),

                // Terms Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: provider.isAgreed,
                      onChanged: provider.toggleAgreement,
                      activeColor: AppColors.primary,
                    ),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(text: "I accept the "),
                            TextSpan(
                              text: "Terms of Service",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            TextSpan(text: " and acknowledge the "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),

                // Join Button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: provider.isAgreed
                        ? AppColors.primaryGradient
                        : null,
                    color: provider.isAgreed ? null : AppColors.unselected,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: provider.isAgreed
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
                        //  () {
                        //   Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => Homescreen()),
                        //   );
                        // },
                        provider.submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      "JOIN THE COLLECTIVE",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),

                // Sign In Bottom Section
                GestureDetector(
                  onTap: () {
                    ///so navigator
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SIGN IN",
                                style: TextStyle(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward,
                                size: 16,
                                color: AppColors.textPrimary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 11,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.border, fontSize: 14),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.divider, width: 2),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      errorStyle: const TextStyle(height: 0.5),
    );
  }
}
