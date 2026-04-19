import 'package:flutter/material.dart';

class AddressModel {
  final String id, name, tag, address, phone;
  AddressModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.address,
    required this.phone,
  });
}

class CheckoutScreenProvider extends ChangeNotifier {
  // List of addresses
  List<AddressModel> _addresses = [
    AddressModel(
      id: '1',
      name: 'Eleanor Vance',
      tag: 'HOME',
      address: '452 Fifth Avenue, Suite 1200\nManhattan, New York, 10018',
      phone: '+1 (212) 555-0198',
    ),
    AddressModel(
      id: '2',
      name: 'Eleanor Vance',
      tag: 'STUDIO',
      address: '1278 Broadway, Floor 4\nBrooklyn, New York, 11221',
      phone: '+1 (718) 555-0432',
    ),
  ];

  String _selectedAddressId = '1';

  List<AddressModel> get addresses => _addresses;
  String get selectedAddressId => _selectedAddressId;

  // Address select karne ka logic
  void selectAddress(String id) {
    _selectedAddressId = id;
    notifyListeners();
  }

  // Naya address add karne ka logic
  void addNewAddress(AddressModel newAddress) {
    _addresses.add(newAddress);
    notifyListeners();
  }
}
