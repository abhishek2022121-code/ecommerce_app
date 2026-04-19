import 'package:flutter/material.dart';

class ShipmentItem {
  final String title, size, color, price, image;
  final int qty;

  ShipmentItem({
    required this.title,
    required this.size,
    required this.color,
    required this.price,
    required this.image,
    required this.qty,
  });
}

class Checkoutorderplacedsuccessfulyprovider extends ChangeNotifier {
  String orderId = "#VP-9284-AX";
  String estDelivery = "Oct 24 - 26";
  String subtotal = "\$1,340.00";
  String shipping = "FREE";
  String totalPaid = "\$1,340.00";

  final List<ShipmentItem> items = [
    ShipmentItem(
      title: "Artisan Wool Overcoat",
      size: "M",
      color: "Camel",
      price: "\$450.00",
      image: "assets/girl.png", // Replace with your asset path
      qty: 1,
    ),
    ShipmentItem(
      title: "Crystal Stiletto Pumps",
      size: "38",
      color: "Pearl White",
      price: "\$890.00",
      image: "assets/girl.png", // Replace with your asset path
      qty: 1,
    ),
  ];

  void continueShopping(BuildContext context) {
    // Navigate back to home or shop
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
