import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  // State variables
  String selectedSize = 'Small';
  int selectedColorIndex = 0;
  bool isFavorite = false;

  final List<Color> productColors = [
    const Color(0xFFB03050), // Crimson Muse
    const Color(0xFF1A1C2E), // Dark Navy
    const Color(0xFFF8C8DC), // Soft Pink
  ];

  final List<String> sizes = ['Mini', 'Small', 'Classic', 'Grand'];

  void selectSize(String size) {
    selectedSize = size;
    notifyListeners();
  }

  void selectColor(int index) {
    selectedColorIndex = index;
    notifyListeners();
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
