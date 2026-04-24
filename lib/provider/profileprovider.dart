import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  String name = " ";
  int points = 2450;
  String tier = "TIER";

  File? profileImage;

  final ImagePicker _picker = ImagePicker();

  ProfileProvider() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name') ?? "User";

    notifyListeners();
  }

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source, // Yahan dynamic source aayega
      imageQuality: 80,
    );

    if (image != null) {
      profileImage = File(image.path);
      notifyListeners();
    }
  }

  void logout() {
    print("User Logged Out");
  }
}
