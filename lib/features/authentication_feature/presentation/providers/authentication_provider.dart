import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../core/provider/base_notifier.dart';


class AuthenticationProvider extends BaseNotifier {

  AuthenticationProvider() {
    init();
  }
  final identityFormKey = GlobalKey<FormBuilderState>();
  final passwordFormKey = GlobalKey<FormBuilderState>();
  final resetPasswordFormKey = GlobalKey<FormBuilderState>();
  final registerFormKey = GlobalKey<FormBuilderState>();
  final changeMobileNumberFormKey = GlobalKey<FormBuilderState>();
  Widget? whereToGoAfterLogin;

  Future<void> init() async {
  }

}
