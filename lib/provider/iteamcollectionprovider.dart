import 'package:flutter/material.dart';

class Product {
  final String id,
      name,
      brand,
      image,
      price,
      oldPrice,
      discount,
      rating,
      reviews;
  final bool isNew;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    this.isNew = false,
    this.isFavorite = false,
  });
}

class IteamcollectionProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      brand: 'AURELIA STUDIO',
      name: 'Sunset Silk Maxi Dress',
      price: '180.00',
      oldPrice: '225.00',
      discount: '-20%',
      rating: '4.8',
      reviews: '124',
      image: 'assets/girl.png',
    ),
    Product(
      id: '2',
      brand: 'NOIR COLLECTIVE',
      name: 'Structured Linen Blazer',
      price: '310.00',
      oldPrice: '',
      discount: '',
      rating: '4.9',
      reviews: '87',
      image: 'assets/girl.png',
    ),
    Product(
      id: '3',
      brand: 'BLOOM & WILD',
      name: 'Floral Midi Skirt',
      price: '145.00',
      oldPrice: '',
      discount: '',
      rating: '4.6',
      reviews: '310',
      image: 'assets/girl.png',
    ),
    Product(
      id: '4',
      brand: 'ESSENTIALIST',
      name: 'Pima Cotton Tee',
      price: '65.00',
      oldPrice: '',
      discount: '',
      rating: '5.0',
      reviews: '45',
      image: 'assets/girl.png',
      isNew: true,
    ),
  ];

  List<Product> get products => _products;

  void toggleFavorite(int index) {
    _products[index].isFavorite = !_products[index].isFavorite;
    notifyListeners();
  }
}
