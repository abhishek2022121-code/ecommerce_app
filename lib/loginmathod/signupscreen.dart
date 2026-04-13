import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/bottomnave/navbaritems.dart';
import 'package:ecomerce/l10n/app_localizations.dart';
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
    // 2. Localization instance
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
          l10n.appTitle, // "QUICK FASHION"
          style: const TextStyle(
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
                Text(
                  l10n.signupCreate, // "CREATE"
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
                Text(
                  l10n.signupAccount, // "ACCOUNT"
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  l10n.signupSubtitle, // "Join the global avant-garde..."
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: size.height * 0.05),

                // Full Name
                _buildFieldTitle(l10n.labelFullName), // "FULL NAME"
                TextFormField(
                  controller: provider.nameController,
                  validator: provider.validateName,
                  decoration: _inputDecoration(
                    l10n.hintFullName,
                  ), // "ALEXANDER MCQUEEN"
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),

                // Email Address
                _buildFieldTitle(l10n.labelEmail), // "EMAIL ADDRESS"
                TextFormField(
                  controller: provider.emailController,
                  validator: provider.validateEmail,
                  decoration: _inputDecoration("alex@fashion.com"),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),

                // Password
                _buildFieldTitle(l10n.labelPassword), // "PASSWORD"
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
                        text: TextSpan(
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(text: l10n.termsIHaveRead),
                            TextSpan(
                              text: l10n.termsOfService,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            TextSpan(text: l10n.termsAndAcknowledge),
                            TextSpan(
                              text: l10n.termsPrivacyPolicy, // "Privacy Policy"
                              style: const TextStyle(
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
                    onPressed: () {
                      final provider = context.read<SignProvider>();

                      if (provider.formKey.currentState!.validate()) {
                        if (provider.isAgreed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Login Successful"),
                            ),
                          );

                          provider.setloading(true);
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => Navbaritems()),
                            );
                          });
                        } else {
                          provider.setloading(false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Please accept terms & conditions"),
                            ),
                          );
                        }
                      } else {
                        // Validation failed
                        provider.setloading(false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields correctly"),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: provider.loading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            l10n.btnJoinCollective,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        l10n.footerAlreadyAccount,
                        style: const TextStyle(
                          color: AppColors.textLight,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.btnSignInSignup, // "SIGN IN"
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
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
