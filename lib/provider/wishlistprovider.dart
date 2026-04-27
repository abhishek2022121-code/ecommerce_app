import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product {
  final String id, name, price, image, brand;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.brand,
  });

  // Data save karne ke liye JSON mein convert karna zaroori hai
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'image': image,
    'brand': brand,
  };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    price: json['price'],
    image: json['image'],
    brand: json['brand'],
  );
}

class WishlistProvider extends ChangeNotifier {
  List<Product> _wishlistItems = [];
  List<Product> get wishlistItems => _wishlistItems;

  WishlistProvider() {
    loadWishlist(); // App khulte hi purana data load karega
  }

  // ✅ Toggle Logic with notifyListeners
  void toggleWishlist(Product product) {
    final index = _wishlistItems.indexWhere((item) => item.id == product.id);

    if (index >= 0) {
      _wishlistItems.removeAt(index);
    } else {
      // Naya item hamesha top par add karne ke liye insert(0, ...)
      _wishlistItems.insert(0, product);
    }

    saveToPrefs(); // Local storage mein save karo
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return _wishlistItems.any((item) => item.id == productId);
  }

  // ✅ DATA PERSISTENCE: Save to Local Storage
  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(
      _wishlistItems.map((item) => item.toJson()).toList(),
    );
    await prefs.setString('user_wishlist', encodedData);
  }

  // ✅ DATA PERSISTENCE: Load from Local Storage
  Future<void> loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('user_wishlist');

    if (data != null) {
      final List decodedData = jsonDecode(data);
      _wishlistItems = decodedData
          .map((item) => Product.fromJson(item))
          .toList();
      notifyListeners();
    }
  }
}
