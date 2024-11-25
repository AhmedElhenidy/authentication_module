import 'dart:async';
import 'package:authentication_module/tameeni.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/enums/env.dart';
import 'core/get_it_injection.dart';

late final bool isAppNotSecured;
const ENV env = ENV.QC;

void main() async {
  await warmingUpTameeni();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const AuthenticationWrapper(),
  );
}

Future<void> warmingUpTameeni() async {
  //* Setting system bar icons to be dark while application background is white
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  //* Widgets Binding Initialized
  WidgetsFlutterBinding.ensureInitialized();

  //* Initialize Localization
  await EasyLocalization.ensureInitialized();
  //* Initialize Get injection
  await init();
}
