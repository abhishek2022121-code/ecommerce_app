import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? validateEmail(String email) {
    if (email.isEmpty) return "Email is required";

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(email)) {
      return "Enter valid email";
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return "Password is required";
    if (password.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  Future<String?> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final emailError = validateEmail(email);
    if (emailError != null) return emailError;

    final passwordError = validatePassword(password);
    if (passwordError != null) return passwordError;

    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    return null; // success
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
