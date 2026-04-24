import 'package:flutter/material.dart';

class ProfileSettingProvider extends ChangeNotifier {
  bool _notificationsEnabled = true;
  String _selectedLanguage = "English (US)";
  String _selectedTheme = "System Default";

  bool get notificationsEnabled => _notificationsEnabled;
  String get selectedLanguage => _selectedLanguage;
  String get selectedTheme => _selectedTheme;

  void toggleNotifications(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  void setLanguage(String lang) {
    _selectedLanguage = lang;
    notifyListeners();
  }

  // Logout logic
  void logout(BuildContext context) {
    // Perform logout actions
    print("User Logged Out");
  }
}
