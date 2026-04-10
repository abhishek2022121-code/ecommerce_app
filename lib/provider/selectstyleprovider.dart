import 'package:flutter/material.dart';

class SelectStylesProvider extends ChangeNotifier {
  final List<String> _selected = ["Streetwear", "Footwear"];

  List<String> get selected => _selected;

  void toggle(String style) {
    if (_selected.contains(style)) {
      _selected.remove(style);
    } else {
      _selected.add(style);
    }
    notifyListeners();
  }
}
