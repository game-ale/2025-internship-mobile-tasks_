import 'package:flutter/material.dart';
import '../themes/text_styles.dart';

class InputTypeName extends StatelessWidget {
  const InputTypeName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Text('$name', style: AppTextStyles.bodyText),
    );
  }
}
