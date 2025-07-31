import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class IconsBox extends StatelessWidget {
  final Widget child;

  const IconsBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderPrimary, width: 1),
      ),
      child: child,
    );
  }
}
