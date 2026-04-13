import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  LanguageProvider() {
    _loadFromPrefs();
  }

  void setLanguage(String langCode) async {
    _locale = Locale(langCode);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_lang', langCode);
  }

  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLang = prefs.getString('selected_lang');

    if (savedLang != null) {
      _locale = Locale(savedLang);
      notifyListeners();
    }
  }

  bool isSelected(String langCode) => _locale.languageCode == langCode;
}
