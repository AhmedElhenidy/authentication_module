import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../../../core/common-widgets/buttons/solid_button.dart';
import '../../../../core/common-widgets/forms/app_text_field_widget.dart';
import '../../../../core/enums/login.dart';
import '../../../../core/provider/base_notifier.dart';
import '../../../../core/utils/constants/form_controller_keys.dart';
import '../../../../core/utils/style/color_manager.dart';
import '../../../../core/utils/style/text_manager.dart';
import '../providers/authentication_provider.dart';
import '../widgets/text_button_with_arrow.dart';

class PasswordScreen extends StatefulWidget {
  final String identityNumber;
  const PasswordScreen({required this.identityNumber, super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isSecure = true;
  final passwordFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: passwordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter password registered to'.tr(),
                style: TextStyleManager.bold16Bold,
              ),
              6.verticalSpace,
              Text(
                widget.identityNumber,
                style: TextStyleManager.regular12Reg,
              ),
              24.verticalSpace,
              AppTextField(
                controllerName: FormControllerKeys.password,
                label: 'Password'.tr(),
                obscure: _isSecure,
                validators: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'Password is required'.tr(),
                  ),
                  FormBuilderValidators.minLength(
                    6,
                    errorText: 'Password must contain at least 6 digits'.tr(),
                  ),
                ]),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                suffix: InkWell(
                  onTap: () {
                    _isSecure = !_isSecure;
                    setState(() {});
                  },
                  child: Icon(
                    _isSecure
                        ? Icons.remove_red_eye_rounded
                        : Icons.visibility_off_rounded,
                  ),
                ),
              ),
              24.verticalSpace,
              // TextButtonWithArrow(
              //   onPressed: () {
              //
              //   },
              //   text: 'Reset Password with OTP'.tr(),
              // ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: ColorManager.basicsWhite,
        margin: const EdgeInsets.only(bottom: 25, left: 16, right: 16),
        child: SolidButton(
          text: 'Confirm'.tr(),
          onPressed: () {
            if (passwordFormKey.currentState?.saveAndValidate() ??
                false) {

            }
          },
        ),
      ),
    );
  }
}
