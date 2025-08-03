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
          50, 
      child: TextField(
        expands: true, 
        maxLines: null, 
        minLines: null, 
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