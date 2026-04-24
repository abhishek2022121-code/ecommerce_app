import 'package:flutter/material.dart';

class OrderItem {
  final String title;
  final String id;
  final String date;
  final double price;
  final String imageUrl;
  final String status; // 'In Transit', 'Delivered', 'Cancelled'
  final String? deliveryDate;

  OrderItem({
    required this.title,
    required this.id,
    required this.date,
    required this.price,
    required this.imageUrl,
    required this.status,
    this.deliveryDate,
  });
}

class AllOrderProvider with ChangeNotifier {
  final List<OrderItem> _orders = [
    OrderItem(
      title: "Vogue Sculpt Trousers",
      id: "#VP-829102",
      date: "OCT 24, 2023",
      price: 189.00,
      imageUrl: "https://via.placeholder.com/150", // Replace with your assets
      status: "In Transit",
      deliveryDate: "Oct 28, 2023",
    ),
    OrderItem(
      title: "Silk Gala Handbag",
      id: "#VP-712893",
      date: "OCT 15, 2023",
      price: 345.50,
      imageUrl: "https://via.placeholder.com/150",
      status: "Delivered",
    ),
    OrderItem(
      title: "Icon Oversized Blazer",
      id: "#VP-655412",
      date: "SEPT 28, 2023",
      price: 220.00,
      imageUrl: "https://via.placeholder.com/150",
      status: "Delivered",
    ),
    OrderItem(
      title: "Midnight Stilettos",
      id: "#VP-544109",
      date: "AUG 12, 2023",
      price: 160.00,
      imageUrl: "https://via.placeholder.com/150",
      status: "Cancelled",
    ),
  ];

  List<OrderItem> get orders => _orders;
}
