import 'package:flutter/material.dart';

class OrderDetailsProvider with ChangeNotifier {
  // Mock Data
  final String orderId = "#VP-92834710";
  final String orderDate = "24 Oct, 2023";
  final String itemName = "Vogue Sculpt Trousers";
  final String itemSize = "M";
  final int itemQty = 1;
  final String itemColor = "Rose Blush";

  final double subtotal = 189.00;
  final double shippingFee = 0.00;
  final double taxPercent = 0.08; // 8%
  final double couponDiscount = 37.80;

  int currentStep =
      1; // 0: Confirmed, 1: Shipped, 2: Out for delivery, 3: Delivered

  double get taxAmount => subtotal * taxPercent;
  double get grandTotal =>
      (subtotal + shippingFee + taxAmount) - couponDiscount;

  void downloadInvoice() {
    // Logic for invoice download
    print("Downloading invoice...");
  }
}
