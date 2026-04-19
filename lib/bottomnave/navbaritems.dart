import 'package:flutter/material.dart';

import 'package:ecomerce/bottomnave/categoriesscreen.dart';
import 'package:ecomerce/bottomnave/homescreen.dart';
import 'package:ecomerce/bottomnave/profilescreen.dart';
import 'package:ecomerce/bottomnave/trandingscreen.dart';
import 'package:ecomerce/bottomnave/wishlistscreen.dart';
import 'package:ecomerce/colorce/appcolors.dart';

class Navbaritems extends StatefulWidget {
  const Navbaritems({super.key});

  @override
  State<Navbaritems> createState() => _NavbaritemsState();
}

class _NavbaritemsState extends State<Navbaritems> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Homescreen(),
    const Categories(),
    const TrendingScreen(),
    const Wishlistscreen(),
    const Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.scaffoldBg,
      body: _pages[_selectedIndex],
      // Use ExtendBody to allow the FAB/Navbar to float nicely over content
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5), // Floating margin
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_filled, Icons.home_outlined, "HOME"),
              _buildNavItem(
                1,
                Icons.grid_view_rounded,
                Icons.grid_view_outlined,
                "CATEGORY",
              ),
              _buildNavItem(
                2,
                Icons.local_fire_department,
                Icons.local_fire_department_outlined,
                "TRENDING",
              ),
              _buildNavItem(
                3,
                Icons.favorite,
                Icons.favorite_border,
                "WISHLIST",
              ),
              _buildNavItem(4, Icons.person, Icons.person_outline, "PROFILE"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData activeIcon,
    IconData inactiveIcon,
    String label,
  ) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(8),

        width: 65,
        height: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? const Color(0xFFC34A5E) : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : inactiveIcon,
              color: isSelected ? Colors.white : const Color(0xFF4A3239),
              size: 24,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF4A3239),
                fontSize: 8,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
