import 'package:flutter/material.dart';

class ProfileDetailProvider extends ChangeNotifier {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController(
    text: "abhishek",
  );
  final TextEditingController emailController = TextEditingController(
    text: "name@example.cm",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "+1 (555) 928-3746",
  );

  String selectedGender = 'Female';

  void setGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void saveChanges() {
    // Yahan aap API call ya database update logic likh sakte hain
    print("Saving Data...");
    print("Name: ${nameController.text}");
    print("Gender: $selectedGender");
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
