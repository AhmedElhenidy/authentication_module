import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/style/color_manager.dart';
import '../../utils/style/text_manager.dart';

class AppCheckBoxField extends StatelessWidget {
  final String controllerName;
  final double? height;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final bool? obscure;
  final bool? initialValue;
  final int maxLines;
  final String label;
  final int maxErrorLines;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget? customToolTipWidget;
  final bool enabled;
  final String? Function(bool?)? validators;
  final Function(bool?)? onChange;
  final TextInputType keyboardType;
  final Widget? suffix;
  final ValueTransformer<bool?>? valueTransformer;
  final String? prefixText;

  const AppCheckBoxField({
    super.key,
    required this.controllerName,
    required this.label,
    this.textEditingController,
    this.focusNode,
    this.inputFormatters = const [],
    this.initialValue,
    this.onChange,
    this.enabled = true,
    this.obscure,
    this.suffixIcon,
    this.customToolTipWidget,
    this.keyboardType = TextInputType.text,
    this.maxErrorLines = 2,
    this.maxLines = 1,
    this.validators,
    this.height,
    this.suffix,
    this.valueTransformer,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: controllerName,
      validator: validators,
      initialValue: initialValue,
      valueTransformer: valueTransformer,
      focusNode: focusNode,
      onChanged: onChange,
      enabled: enabled,
      side: BorderSide(color: ColorManager.greyGrey4, width: 1.sp),
      checkColor: ColorManager.primaryPrimary1,
      activeColor: ColorManager.primaryPrimary6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
      ),
      title: Text(
        label,
        style: TextStyleManager.medium12Medium,
      ),
    );
  }
}
