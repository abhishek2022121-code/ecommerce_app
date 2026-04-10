import 'package:flutter/material.dart';

// Definining Genders enum for clear types
enum SelectedGender { none, female, male }

class GenderProvider extends ChangeNotifier {
  SelectedGender _selectedGender =
      SelectedGender.none; // No selection by default

  SelectedGender get selectedGender => _selectedGender;

  void selectGender(SelectedGender gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  // Helper getters for clarity in UI
  bool get isFemaleSelected => _selectedGender == SelectedGender.female;
  bool get isMaleSelected => _selectedGender == SelectedGender.male;
}
