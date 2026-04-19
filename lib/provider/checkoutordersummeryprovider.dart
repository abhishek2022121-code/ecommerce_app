import 'package:flutter/material.dart';

class OrderItem {
  final String image, name;
  final int qty;
  OrderItem({required this.image, required this.name, required this.qty});
}

class Checkoutordersummeryprovider extends ChangeNotifier {
  // Shipping Data
  String userName = "Jordan Henderson";
  String address = "482 Fashion Avenue, Upper West Side\nNew York, NY 10024";
  String phone = "+1 (555) 012-3456";

  // Items in Selection
  List<OrderItem> selectedItems = [
    OrderItem(image: 'assets/girl.png', name: 'Safe Front Work', qty: 1),
    OrderItem(image: 'assets/girl.png', name: 'Safe - Work', qty: 1),
  ];

  // Price Calculation Logic
  double bagTotal = 1450.00;
  double bagDiscount = 220.00;
  double couponDiscount = 80.00;
  double gstPercentage = 0.18;

  double get gstAmount =>
      (bagTotal - bagDiscount - couponDiscount) * gstPercentage;
  double get totalAmount =>
      (bagTotal - bagDiscount - couponDiscount) + gstAmount;

  void changeShipping() {
    // Logic to change address
    notifyListeners();
  }
}
