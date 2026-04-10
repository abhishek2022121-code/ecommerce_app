import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void login() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      _isLoading = true;
      notifyListeners();

      // Simulate login delay
      Future.delayed(const Duration(seconds: 2), () {
        _isLoading = false;
        notifyListeners();
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
