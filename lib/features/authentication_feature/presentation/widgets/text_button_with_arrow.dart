import 'package:flutter/material.dart';
import '../../../../core/common-widgets/buttons/button_text.dart';
import '../../../../core/utils/style/text_manager.dart';

class TextButtonWithArrow extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const TextButtonWithArrow({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonText(
        text: '',
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyleManager.bold12Bold,
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
