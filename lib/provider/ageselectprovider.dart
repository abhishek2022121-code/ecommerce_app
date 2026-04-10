import 'package:flutter/material.dart';

class AgeSelectProvider extends ChangeNotifier {
  String _selectedBracket = "19-24"; // Default selected

  String get selectedBracket => _selectedBracket;

  void selectBracket(String bracket) {
    _selectedBracket = bracket;
    notifyListeners();
  }
}
