import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecomerce/colorce/appcolors.dart';
import 'package:ecomerce/provider/customsearchappbarprovider.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBagPressed;
  final Widget? leadingWidget;

  const CustomSearchAppBar({
    super.key,
    required this.title,
    required this.onBagPressed,
    this.leadingWidget,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5);

  @override
  Widget build(BuildContext context) {
    final searchProv = Provider.of<CustomSearchProvider>(context);

    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 4.0,
      shadowColor: Colors.black.withOpacity(0.3),
      centerTitle: true,

      leading: searchProv.isSearching
          ? IconButton(
              icon: const Icon(Icons.close, color: Color(0xFFC34A5E)),
              onPressed: () => searchProv.toggleSearch(false),
            )
          : leadingWidget ??
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/applogo.png'), // Default Logo
                ),

      title: searchProv.isSearching
          ? TextField(
              controller: searchProv.searchController,
              autofocus: true,
              style: const TextStyle(color: Color(0xFF4A3239)),
              decoration: const InputDecoration(
                hintText: "Search items...",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            )
          : Text(
              title,
              style: const TextStyle(
                color: Color(0xFF4A3239),
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),

      actions: [
        if (!searchProv.isSearching)
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFFC34A5E)),
            onPressed: () => searchProv.toggleSearch(true),
          ),
        const SizedBox(width: 5),
        IconButton(
          onPressed: onBagPressed,
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: Color(0xFFC34A5E),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
