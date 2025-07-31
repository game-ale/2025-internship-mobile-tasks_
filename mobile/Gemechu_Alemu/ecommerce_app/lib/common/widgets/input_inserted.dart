import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
class InputInserted extends StatelessWidget {
  final double? height;

  const InputInserted({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          height ??
          50, // Use Container instead of SizedBox for more flexibility
      child: TextField(
        expands: true, // <- This makes TextField expand to the parent's height
        maxLines: null, // Required when using expands
        minLines: null, // Required when using expands
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.borderPrimary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}