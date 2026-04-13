import 'package:flutter/material.dart';

class Product {
  final String brand;
  final String name;
  final double price;
  final double? oldPrice;
  final String discount;
  final double rating;
  final int reviews;
  final bool isNew;
  bool isFavorite; // Logic state for heart icon

  Product({
    required this.brand,
    required this.name,
    required this.price,
    this.oldPrice,
    this.discount = "",
    required this.rating,
    required this.reviews,
    this.isNew = false,
    this.isFavorite = false,
  });
}

class Categoriprovider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      brand: "AURELIA STUDIO",
      name: "Sunset Silk Maxi Dress",
      price: 180.00,
      oldPrice: 225.00,
      discount: "-20%",
      rating: 4.8,
      reviews: 124,
    ),
    Product(
      brand: "NOIR COLLECTIVE",
      name: "Structured Linen Blazer",
      price: 310.00,
      rating: 4.9,
      reviews: 82,
    ),
    Product(
      brand: "BLOOM & WILD",
      name: "Floral Midi Skirt",
      price: 145.00,
      rating: 4.6,
      reviews: 210,
    ),
    Product(
      brand: "ESSENTIALIST",
      name: "Pima Cotton Tee",
      price: 65.00,
      isNew: true,
      rating: 5.0,
      reviews: 45,
    ),
    Product(
      brand: "MAISON VERT",
      name: "Heritage Leather Jacket",
      price: 890.00,
      rating: 4.7,
      reviews: 18,
    ),
    Product(
      brand: "LUNA CRAFT",
      name: "Micro Satchel Bag",
      price: 420.00,
      oldPrice: 495.00,
      discount: "-15%",
      rating: 4.9,
      reviews: 156,
    ),
  ];

  List<Product> get products => _products;

  // Toggle favorite logic
  void toggleFavorite(int index) {
    _products[index].isFavorite = !_products[index].isFavorite;
    notifyListeners(); // Refresh UI
  }
}
