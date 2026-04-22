import 'package:flutter/material.dart';

class OrderItem {
  final String title;
  final String price;
  final String orderId;
  final String date;
  final String status;
  final String imagePath;
  final String? deliveryDate;

  OrderItem({
    required this.title,
    required this.price,
    required this.orderId,
    required this.date,
    required this.status,
    required this.imagePath,
    this.deliveryDate,
  });
}

class MyOrdersProvider extends ChangeNotifier {
  int _selectedFilterIndex = 0;
  int get selectedFilterIndex => _selectedFilterIndex;

  final List<String> filters = ["All Orders", "In Transit", "Delivered"];

  void setFilter(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }

  final List<OrderItem> allOrders = [
    OrderItem(
      title: "Vogue Sculpt Trousers",
      price: "₹189.00",
      orderId: "#VP-829102",
      date: "OCT 24, 2023",
      status: "In Transit",
      imagePath: "assets/girl.png",
      deliveryDate: "Oct 28, 2023",
    ),
    OrderItem(
      title: "Silk Gala Handbag",
      price: "₹345.50",
      orderId: "#VP-712893",
      date: "OCT 15, 2023",
      status: "Delivered",
      imagePath: "assets/bag.png",
    ),
  ];
}
