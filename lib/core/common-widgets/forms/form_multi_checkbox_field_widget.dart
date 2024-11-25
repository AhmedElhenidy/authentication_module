import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../utils/style/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/style/text_manager.dart';

class FormMultiCheckBox<T> extends StatelessWidget {
  final String controllerName;
  final String hint;
  final List<FormBuilderFieldOption<T>> children;
  final Function(List<T>?)? onChange;
  final String? Function(dynamic)? validators;
  final double? height;
  const FormMultiCheckBox({
    super.key,
    required this.controllerName,
    required this.children,
    required this.hint,
    this.validators,
    this.onChange,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckboxGroup(
      name: controllerName,
      validator: validators,
      orientation: OptionsOrientation.vertical,
      activeColor: Colors.white,
      checkColor: ColorManager.primaryPrimary6,
      options: children,
      onChanged: onChange,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -2),
      decoration: const InputDecoration()
          .applyDefaults(Theme.of(context).inputDecorationTheme)
          .copyWith(
            labelText: hint,
            labelStyle: TextStyleManager.bold12Bold,
            contentPadding: const EdgeInsets.all(0),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 24.h,
              maxWidth: 40.w,
              minHeight: 22.h,
              minWidth: 40.w,
            ),
            border: InputBorder.none,
          ),
    );
  }
}
