import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class IconButtonRounded extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;

  const IconButtonRounded({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Icon(icon, size: 24),
      ),
    );
  }
}
