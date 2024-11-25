import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/numbers_constant.dart';
import '../../utils/extensions/screen_util_extensions.dart';
import '../../utils/formatters/formatter.dart';
import '../../utils/style/color_manager.dart';
import '../../utils/ui_utils.dart';
import '../text_widget.dart';
import 'dart:ui' as ui;

class AppTextField extends StatelessWidget {
  final String controllerName;
  final double? height;
  final FocusNode? focusNode;
  final bool? obscure;
  final String? initialValue;
  final int maxLines;
  final String label;
  final int maxErrorLines;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget? customToolTipWidget;
  final bool enabled;
  final String? Function(String?)? validators;
  final Function(String?)? onChange;
  final TextInputType keyboardType;
  final Widget? suffix;
  final ValueTransformer<String?>? valueTransformer;
  final String? prefixText;
  final String? suffixText;
  final bool isAmountValue;
  final ui.TextDirection? textDirection;
  final TextAlign textAlign;

  const AppTextField({
    super.key,
    required this.controllerName,
    required this.label,
    this.focusNode,
    this.isAmountValue = false,
    this.inputFormatters,
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
    this.suffixText,
    this.textDirection,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: initialValue);
    bool firstTime = true;

    return FormBuilderField(
      name: controllerName,
      validator: validators,
      initialValue: initialValue,
      valueTransformer: valueTransformer,
      focusNode: focusNode,
      onChanged: onChange,
      enabled: enabled,
      builder: (field) {
        if (firstTime) {
          SchedulerBinding.instance.addPostFrameCallback((_) async {
            field.didChange(field.value);
            try {
              if (isAmountValue) {
                final value = AppFormatter.priceFormatterZeroO
                    .format(int.tryParse(field.value ?? ''));
                controller.value = TextEditingValue(text: value);
              } else {
                controller.value = TextEditingValue(text: field.value ?? '');
              }
            } catch (e) {
              controller.value = TextEditingValue(text: field.value ?? '');
            }

            firstTime = false;
          });
        }

        void convertNumbers(String value) {
          // Convert Arabic numbers to English numbers
          String englishNumbers = value.replaceAllMapped(
            AppRegEx.arabicNumbers,
            (match) => AppNumbersConstant.arabicToEnglish[match.group(0)]!,
          );

          // Update the controller value if conversion happened
          if (englishNumbers != value) {
            controller.value = controller.value.copyWith(
              text: englishNumbers,
              selection: TextSelection.collapsed(offset: englishNumbers.length),
            );
          }

          // Handle field value change based on whether it's an amount value or not
          String finalValue = isAmountValue
              ? englishNumbers.replaceAll(',', '')
              : englishNumbers;
          field.didChange(finalValue);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1.sw,
              height: (ScreenUtil().isBiggerThanMobileScreen ? 40.h : 56.h),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: ShapeDecoration(
                color: enabled ? Colors.white : ColorManager.greyGrey2,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: field.errorText != null
                        ? ColorManager.errorError6
                        : const Color(0xFFD5D9E1),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: TextField(
                maxLines: maxLines,
                enableSuggestions: true,
                inputFormatters: inputFormatters,
                obscureText: obscure ?? false,
                obscuringCharacter: '❋',
                controller: controller,
                onChanged: convertNumbers,
                textDirection: textDirection,
                textAlign: textAlign,
                onTapOutside: (event) {
                  UIUtils.removeKeyboard();
                },
                enabled: enabled,
                keyboardType: keyboardType,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: !enabled ? ColorManager.greyGrey5 : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration()
                    .applyDefaults(Theme.of(context).inputDecorationTheme)
                    .copyWith(
                      // contentPadding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16),
                      labelText: label,
                      errorStyle: const TextStyle(fontSize: 0),
                      labelStyle: TextStyle(
                        fontSize: 12.sp,
                        color: !enabled
                            ? ColorManager.greyGrey5
                            : field.errorText != null
                                ? ColorManager.errorError6
                                : ColorManager.greyGrey5,
                      ),
                      suffixIcon: suffixIcon,
                      suffix: suffix,
                      suffixText:
                          suffixText != null ? '${suffixText!}\t' : null,
                      prefixText:
                          prefixText != null ? '${prefixText!}\t' : null,
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: 24.h,
                        maxWidth: 50.w,
                        minHeight: 22.h,
                        minWidth: 50.w,
                      ),
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
            if (field.errorText != null ||
                (field.errorText?.isNotEmpty ?? false)) ...[
              8.verticalSpace,
              TextWidget(
                title: '\t\t\t${field.errorText ?? ''}',
                titleColor: ColorManager.errorError6,
                size: 12.sp,
                titleMaxLines: 3,
              ),
            ],
          ],
        );
      },
    );
  }
}
