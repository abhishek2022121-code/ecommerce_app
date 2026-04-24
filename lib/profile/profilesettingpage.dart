import 'package:ecomerce/provider/profilesettingprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Provider file ko import karein

class ProfileSettingPage extends StatelessWidget {
  const ProfileSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<ProfileSettingProvider>(context);

    const primaryPink = Color(0xFFC34A5E);
    const bgLight = Color(0xFFFDF7F8);
    const cardBg = Colors.white;

    return Scaffold(
      backgroundColor: bgLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryPink),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: primaryPink,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 14,
              backgroundColor: primaryPink.withOpacity(0.1),
              child: const Icon(
                Icons.person_outline,
                size: 16,
                color: primaryPink,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Profile Header Section ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            'assets/user_placeholder.png',
                          ), // User avatar
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: primaryPink,
                          child: const Icon(
                            Icons.edit,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sumit",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF4A3239),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: primaryPink.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "ELITE MEMBER",
                          style: TextStyle(
                            color: primaryPink,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- Pulse Points Card ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF9E2A47), Color(0xFFD65A74)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.local_offer,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "PULSE POINTS",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "1.2k",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            _sectionTitle("ACCOUNT SETTINGS"),
            _buildSettingsGroup([
              _settingsTile(
                Icons.person_outline,
                "Personal Information",
                "Update your details and style profile",
              ),
              _settingsTile(
                Icons.location_on_outlined,
                "Shipping Addresses",
                "Manage your primary and secondary locations",
              ),
              _settingsTile(
                Icons.account_balance_wallet_outlined,
                "Payment Methods",
                "Cards, Apple Pay, and digital wallets",
              ),
            ]),

            const SizedBox(height: 25),
            _sectionTitle("PREFERENCES"),
            _buildSettingsGroup([
              _settingsTile(
                Icons.notifications_none_outlined,
                "Notifications",
                "Sales, new drops, and status updates",
                trailing: Switch(
                  value: provider.notificationsEnabled,
                  onChanged: (val) => provider.toggleNotifications(val),
                  activeColor: primaryPink,
                ),
              ),
              _settingsTile(
                Icons.language_outlined,
                "Language",
                provider.selectedLanguage,
                showArrow: true,
              ),
              _settingsTile(
                Icons.palette_outlined,
                "Theme",
                provider.selectedTheme,
                showArrow: true,
              ),
            ]),

            const SizedBox(height: 25),
            _sectionTitle("SECURITY & PRIVACY"),
            _buildSettingsGroup([
              _settingsTile(
                Icons.shield_outlined,
                "Privacy Dashboard",
                "Manage your data and visibility",
              ),
              _settingsTile(
                Icons.lock_outline,
                "Password & 2FA",
                "Secure your fashion footprint",
              ),
            ]),

            const SizedBox(height: 40),
            // --- Logout Button ---
            Center(
              child: InkWell(
                onTap: () => provider.logout(context),
                child: Container(
                  width: size.width * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryPink.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout, color: primaryPink),
                      SizedBox(width: 10),
                      Text(
                        "Log Out",
                        style: TextStyle(
                          color: primaryPink,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: Text(
                "VOGUE PULSE V4.12.0 • MADE WITH LOVE IN PARIS",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 9,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> tiles) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(children: tiles),
    );
  }

  Widget _settingsTile(
    IconData icon,
    String title,
    String subtitle, {
    Widget? trailing,
    bool showArrow = false,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFFDF2F4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xFFC34A5E), size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
      ),
      trailing:
          trailing ??
          (showArrow
              ? const Icon(Icons.keyboard_arrow_down, color: Colors.grey)
              : const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 14,
                )),
    );
  }
}
