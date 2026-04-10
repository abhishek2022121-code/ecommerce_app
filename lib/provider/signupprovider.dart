import 'package:flutter/material.dart';

class SignProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isAgreed = false;
  bool get isAgreed => _isAgreed;

  void toggleAgreement(bool? value) {
    _isAgreed = value ?? false;
    notifyListeners();
  }

  // Validations
  String? validateName(String? value) =>
      (value == null || value.isEmpty) ? "Full Name is required" : null;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))
      return "Enter a valid email";
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6)
      return "Password must be at least 6 characters";
    return null;
  }

  void submit() {
    if (formKey.currentState!.validate() && _isAgreed) {
      print("Account Created for: ${nameController.text}");
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
