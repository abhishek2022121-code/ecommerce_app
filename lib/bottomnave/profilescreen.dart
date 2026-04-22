import 'package:ecomerce/addtobag/addtobagscreen.dart';
import 'package:ecomerce/bottomnave/wishlistscreen.dart';
import 'package:ecomerce/profile/myorder.dart';
import 'package:ecomerce/provider/profileprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:shivam/prvider/profileprovider.dart';
//import 'profile_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF6EDEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5,
        leading: const Icon(Icons.menu, color: Color(0xFFC34A5E)),
        centerTitle: true,
        title: const Text(
          "QUICK FASHION",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Addtobagscreen()),
                // );
              },
              icon: Icon(Icons.shopping_bag_outlined, color: Color(0xFFC34A5E)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),

              Text(
                "Hi ${provider.name} !!",
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: height * 0.02),

              /// Profile Card
              Container(
                height: height * 0.18,
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.02,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF7F8),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    /// Avatar + Edit Icon
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: width * 0.08,
                          backgroundColor: Colors.grey.shade300,
                          backgroundImage: provider.profileImage != null
                              ? FileImage(provider.profileImage!)
                              : null,
                          child: provider.profileImage == null
                              ? Icon(Icons.person, size: width * 0.08)
                              : null,
                        ),

                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: GestureDetector(
                            onTap: () => provider.pickImage(),
                            child: Container(
                              height: width * 0.05,
                              width: width * 0.05,
                              decoration: const BoxDecoration(
                                color: Color(0xFFC34A5E),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit,
                                size: width * 0.03,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: width * 0.05),

                    /// Name + Points
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            provider.name,
                            style: TextStyle(
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),

                          SizedBox(height: height * 0.015),

                          Row(
                            children: [
                              _infoBox(
                                title: "POINTS",
                                value: provider.points.toString(),
                                width: width,
                              ),

                              SizedBox(width: width * 0.06),

                              _infoBox(title: "TIER", value: "", width: width),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: width * 0.04,
                mainAxisSpacing: height * 0.02,
                childAspectRatio: 1.3,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyOrderScreen(),
                        ),
                      );
                    },
                    child: _gridItem(Icons.shopping_bag_outlined, "MY ORDERS"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Wishlistscreen(),
                        ),
                      );
                    },
                    child: _gridItem(Icons.favorite_border, "WISHLIST"),
                  ),
                  _gridItem(Icons.confirmation_number_outlined, "COUPONS"),
                  _gridItem(Icons.credit_card, "PAYMENT"),
                ],
              ),
              SizedBox(height: height * 0.01),

              /// Account Settings
              Text(
                "ACCOUNT SETTINGS",
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: width * 0.03,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: height * 0.01),

              _listTile(Icons.person_outline, "Profile Details"),
              _listTile(Icons.location_on_outlined, "Address Book"),
              _listTile(Icons.notifications_none, "Notification Preferences"),
              _listTile(Icons.help_outline, "Help Center"),

              SizedBox(height: height * 0.02),

              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: const Text(
                          "Sign Out",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          "Are you sure you want to sign out of your account?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              provider.logout();
                            },
                            child: const Text(
                              "Sign Out",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign Out",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              /// Bottom Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2B0000), Color(0xFF6A0022)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Style yourself\n with\n Quick Fashion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    _featureText("FREE EXPRESS SHIPPING"),
                    _featureText("EARLY DROP ACCESS"),
                    _featureText("BIRTHDAY GIFT"),
                  ],
                ),
              ),

              SizedBox(height: height * 0.2),
            ],
          ),
        ),
      ),
    );
  }

  /// Small Box (Points / Tier)
  Widget _smallBox({
    required String title,
    required String value,
    required double width,
  }) {
    return Container(
      padding: EdgeInsets.all(width * 0.02),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 10)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  /// Grid Item
  Widget _gridItem(IconData icon, String title) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.pink.shade50,
            child: Icon(icon, color: Color(0xFFC34A5E)),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  /// List Tile
  Widget _listTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFFC34A5E)),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  /// Feature Text
  Widget _featureText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, size: 20, color: Colors.white),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _infoBox({
    required String title,
    required String value,
    required double width,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.025,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFCE4EC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: width * 0.025, color: Colors.grey),
          ),
          SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC34A5E),
            ),
          ),
        ],
      ),
    );
  }
}
