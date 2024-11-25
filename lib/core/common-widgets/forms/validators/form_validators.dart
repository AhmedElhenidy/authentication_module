import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../utils/constants/app_regex.dart';

extension AppValidators on FormBuilderValidators {
  FormFieldValidator<String> idNumber({
    String? errorText,
  }) =>
      FormBuilderValidators.match(AppRegex.idNumber, errorText: errorText);
}
