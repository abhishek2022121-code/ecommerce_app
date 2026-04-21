import 'package:flutter/material.dart';


class Product {
  final String id;
  final String name;
  final String price;
  final String image;
  final String brand;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.brand,
  });
}

class WishlistProvider extends ChangeNotifier {

  final List<Product> _wishlistItems = [];

  List<Product> get wishlistItems => _wishlistItems;

  void toggleWishlist(Product product) {
    final isExist = _wishlistItems.any((item) => item.id == product.id);
    if (isExist) {
      _wishlistItems.removeWhere((item) => item.id == product.id);
    } else {
      _wishlistItems.add(product);
    }
    notifyListeners(); 
  }

  bool isFavorite(String productId) {
    return _wishlistItems.any((item) => item.id == productId);
  }
}
