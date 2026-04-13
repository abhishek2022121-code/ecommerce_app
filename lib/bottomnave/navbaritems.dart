import 'package:ecomerce/bottomnave/categoriesscreen.dart';
import 'package:ecomerce/bottomnave/homescreen.dart';
import 'package:ecomerce/bottomnave/profilescreen.dart';
import 'package:ecomerce/bottomnave/studioscreen.dart';
import 'package:flutter/material.dart';

import 'package:ecomerce/colorce/appcolors.dart';

class Navbaritems extends StatefulWidget {
  const Navbaritems({super.key});

  @override
  State<Navbaritems> createState() => _NavbaritemsState();
}

class _NavbaritemsState extends State<Navbaritems> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Homescreen(),
    Categories(),
    Studioscreen(),
    Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.scaffoldBg,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30), // Floating effect
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            color: ColorStyle.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: ColorStyle.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, Icons.home_filled, Icons.home_outlined, "HOME"),
              _buildNavItem(
                1,
                Icons.grid_view_rounded,
                Icons.grid_view_outlined,
                "CATEGORIES",
              ),
              _buildNavItem(
                2,
                Icons.movie_filter,
                Icons.movie_filter_outlined,
                "STUDIO",
              ),
              _buildNavItem(3, Icons.person, Icons.person_outline, "PROFILE"),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? ColorStyle.primary : Colors.transparent,
            ),
            child: Icon(
              isSelected ? activeIcon : inactiveIcon,
              color: isSelected ? ColorStyle.white : ColorStyle.primary,
              size: 28,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: ColorStyle.textPrimary,
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
