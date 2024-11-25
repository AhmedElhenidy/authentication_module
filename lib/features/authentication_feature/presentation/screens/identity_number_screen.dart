import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../../../../core/common-widgets/buttons/solid_button.dart';
import '../../../../core/common-widgets/forms/app_text_field_widget.dart';
import '../../../../core/common-widgets/forms/validators/form_validators.dart';
import '../../../../core/get_it_injection.dart';
import '../../../../core/utils/constants/form_controller_keys.dart';
import '../../../../core/utils/formatters/formatter.dart';
import '../../../../core/utils/navigation_routes/navigation_utils.dart';
import '../../../../core/utils/style/color_manager.dart';
import '../../../../core/utils/style/text_manager.dart';
import '../providers/authentication_provider.dart';
import 'password_screen.dart';

class IdentityNumberScreen extends StatelessWidget {
  final String? identityNumber;
  const IdentityNumberScreen({this.identityNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: context.read<AuthenticationProvider>().identityFormKey,
          initialValue: {
            FormControllerKeys.idNumber: identityNumber,
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login / Register with your ID Number'.tr(),
                style: TextStyleManager.bold16Bold,
              ),
              6.verticalSpace,
              Text(
                'Logging in and retrieving your data is helpful'.tr(),
                style: TextStyleManager.regular12Reg,
              ),
              24.verticalSpace,
              AppTextField(
                controllerName: FormControllerKeys.idNumber,
                label: 'ID Number'.tr(),
                validators: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: 'National ID/Iqama Number is required'.tr(),
                  ),
                  FormBuilderValidators()
                      .idNumber(errorText: 'Invalid Driver ID'.tr()),
                ]),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  AppFormatter.digitsOnly,
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: ColorManager.basicsWhite,
        margin: const EdgeInsets.only(bottom: 25, left: 16, right: 16),
        child: SolidButton(
          text: 'Next'.tr(),
          onPressed: () {
            if (context
                    .read<AuthenticationProvider>()
                    .identityFormKey
                    .currentState
                    ?.saveAndValidate() ??
                false) {
              if (context
                  .read<AuthenticationProvider>()
                  .identityFormKey
                  .currentState!
                  .value[FormControllerKeys.idNumber]
                  .toString()
                  .startsWith('7')) {
                context
                    .read<AuthenticationProvider>()
                    .identityFormKey
                    .currentState!
                    .fields[FormControllerKeys.idNumber]
                    ?.invalidate('system does not accept Company users'.tr());
                context
                    .read<AuthenticationProvider>()
                    .identityFormKey
                    .currentState!
                    .save();
              } else {
                getIt<NavUtils>().push( PasswordScreen(
                  identityNumber: context
                      .read<AuthenticationProvider>()
                      .identityFormKey
                      .currentState!
                      .value[FormControllerKeys.idNumber]
                      .toString(),
                ));
              }
            }
          },
        ),
      ),
    );
  }
}
