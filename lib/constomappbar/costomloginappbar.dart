import 'package:flutter/material.dart';
import 'package:ecomerce/colorce/appcolors.dart'; // Apna color path check kar lena

class CustomLoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final List<Widget>? customActions;

  const CustomLoginAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.onLeadingPressed,
    this.actionText,
    this.onActionPressed,
    this.customActions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.scaffoldBg,
      elevation: 4.0,
      shadowColor: AppColors.black.withOpacity(0.3),
      centerTitle: true,

      // Left Icon Logic: Agar icon diya hai toh wo, warna default close icon
      leading: IconButton(
        onPressed: onLeadingPressed ?? () => Navigator.pop(context),
        icon:
            leadingIcon ??
            const Icon(Icons.close, color: AppColors.textPrimary),
      ),

      // Center Title Logic
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),

      // Right Action Logic: Agar custom actions hain toh wo, warna skip button
      actions:
          customActions ??
          [
            if (actionText != null)
              TextButton(
                onPressed: onActionPressed,
                child: Text(
                  actionText!,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
    );
  }
}
