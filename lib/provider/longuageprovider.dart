import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _selectedLanguage = "English"; // Default selection

  String get selectedLanguage => _selectedLanguage;

  void setLanguage(String lang) {
    _selectedLanguage = lang;
    notifyListeners();
  }

  bool isSelected(String lang) => _selectedLanguage == lang;
}
