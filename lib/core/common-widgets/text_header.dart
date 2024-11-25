import 'package:flutter/material.dart';

import '../utils/style/text_manager.dart';

class TextHeader extends StatelessWidget {
  final String text;
  final Widget? trailing;

  const TextHeader({
    super.key,
    required this.text,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyleManager.bold16Bold,
        ),
        trailing ?? const SizedBox(),
      ],
    );
  }
}
