import 'package:flutter/material.dart';

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

  // Logic: Jab quantity badhegi, price bhi multiply ho jayega

  double get totalPrice => double.parse(basePrice) * quantity;
}

class AddtobagProvider extends ChangeNotifier {
  final List<BagItem> _items = [
    BagItem(
      id: '1',

      name: 'Aura Bag',

      category: 'Midnight Burgundy | Medium',

      basePrice: '1250',

      image: 'assets/girl.png',
    ),

    BagItem(
      id: '2',

      name: 'Silk Mirage Scarf',

      category: 'Sunset Gradient | One Size',

      basePrice: '320',

      image: 'assets/girl.png',
    ),
  ];

  List<BagItem> get items => _items;

  String selectedPayment = "Credit Card";

  // Address edit logic

  String userName = "Dominic West";

  String userAddress =
      "249 Lexinton Avenue, Suite 12\nManhattan, New York 10016\n+1 (555) 012-3456";

  void updateQuantity(int index, bool isIncrement) {
    if (isIncrement) {
      _items[index].quantity++;
    } else if (_items[index].quantity > 1) {
      _items[index].quantity--;
    }

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
