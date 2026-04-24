import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BagItem {
  final String id, name, category, basePrice, image;
  int quantity;

  BagItem({
    required this.id,
    required this.name,
    required this.category,
    required this.basePrice,
    required this.image,
    this.quantity = 1,
  });

  // ✅ SAFE PRICE (NO CRASH with ₹ / text)
  double get totalPrice {
    final clean = basePrice.replaceAll(RegExp(r'[^0-9.]'), '');
    return (double.tryParse(clean) ?? 0) * quantity;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'basePrice': basePrice,
    'image': image,
    'quantity': quantity,
  };

  factory BagItem.fromJson(Map<String, dynamic> json) => BagItem(
    id: json['id'],
    name: json['name'],
    category: json['category'],
    basePrice: json['basePrice'],
    image: json['image'],
    quantity: (json['quantity'] ?? 1) as int,
  );
}

class AddtobagProvider extends ChangeNotifier {
  List<BagItem> _items = [];

  List<BagItem> get items => _items;

  String selectedPayment = "Credit Card";

  String userName = "Dominic West";

  String userAddress =
      "249 Lexinton Avenue, Suite 12\nManhattan, New York 10016\n+1 (555) 012-3456";

  AddtobagProvider() {
    loadCart();
  }

  // 🔥 LOAD CART (SAFE)
  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cart');

    if (data != null && data.isNotEmpty) {
      final decoded = jsonDecode(data) as List;
      _items = decoded.map((e) => BagItem.fromJson(e)).toList();
      notifyListeners();
    }
  }

  // 🔥 SAVE CART
  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(_items.map((e) => e.toJson()).toList());
    await prefs.setString('cart', data);
  }

  // ✅ ADD ITEM (NO REPLACE)
  // ✅ ADD ITEM (Ab ye selected quantity ke sath add karega)
  void addItem(String name, String price, String image, int selectedQuantity) {
    _items.add(
      BagItem(
        id: DateTime.now().toString(),
        name: name,
        category: "",
        basePrice: price,
        image: image,
        quantity: selectedQuantity, // <--- Yaha quantity set karein
      ),
    );

    saveCart();
    notifyListeners();
  }

  // ❌ DELETE ITEM
  void removeItem(int index) {
    _items.removeAt(index);
    saveCart();
    notifyListeners();
  }

  // 🔁 UPDATE QUANTITY
  void updateQuantity(int index, bool isIncrement) {
    if (isIncrement) {
      _items[index].quantity++;
    } else if (_items[index].quantity > 1) {
      _items[index].quantity--;
    }

    saveCart();
    notifyListeners();
  }

  void selectPayment(String method) {
    selectedPayment = method;
    notifyListeners();
  }

  void updateAddress(String name, String address) {
    userName = name;
    userAddress = address;
    notifyListeners();
  }

  double get totalMRP => _items.fold(0, (sum, item) => sum + item.totalPrice);

  double get bagDiscount => 150.0;

  double get couponDiscount => 284.0;

  double get totalAmount => totalMRP - bagDiscount - couponDiscount;
}
