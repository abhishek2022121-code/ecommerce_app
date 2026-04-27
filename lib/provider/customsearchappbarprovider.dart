import 'package:flutter/material.dart';

class CustomSearchProvider extends ChangeNotifier {
  bool _isSearching = false;
  final TextEditingController searchController = TextEditingController();

  bool get isSearching => _isSearching;
  void toggleSearch(bool value) {
    _isSearching = value;
    if (!value) {
      searchController.clear();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
