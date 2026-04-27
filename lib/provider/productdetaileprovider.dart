import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  String selectedSize = 'Small';
  int selectedColorIndex = 0;
  bool isFavorite = false;

  int quantity = 1;

  // ✅ 1. RESET LOGIC: Naya product aane par ise call karenge
  void resetQuantity() {
    quantity = 1;
    selectedSize = 'Small'; // Optional: Size bhi reset kar sakte hain
    selectedColorIndex = 0; // Optional: Color bhi reset kar sakte hain
    notifyListeners();
  }

  void incrementQuantity() {
    quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  final List<Color> productColors = [
    const Color(0xFFB03050),
    const Color(0xFF1A1C2E),
    const Color(0xFFF8C8DC),
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
