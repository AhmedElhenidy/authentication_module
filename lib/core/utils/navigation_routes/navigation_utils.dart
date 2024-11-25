import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/color_manager.dart';

String _assertMessage =
    'Please use NavService instance with locator by =>  locator<NavService>() ';

class NavUtils {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final PageRoute Function(Widget page) route = Platform.isIOS
      ? (Widget page) => CupertinoPageRoute(builder: (c) => page)
      : (Widget page) => MaterialPageRoute(builder: (c) => page);

  static bool isRTL(String text) {
    return Bidi.detectRtlDirectionality(text);
  }

  Future<dynamic> push(Widget page, {bool replace = false}) async {
    assert(
      navigatorKey.currentState != null,
      _assertMessage,
    );

    return replace
        ? await Navigator.pushReplacement(
            navigatorKey.currentState!.context,
            route(page),
          )
        : await Navigator.push(navigatorKey.currentState!.context, route(page));
  }

  Future<void> pop() async {
    assert(
      navigatorKey.currentState != null,
      _assertMessage,
    );
    try {
      Navigator.pop(navigatorKey.currentState!.context);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void openFullScreenDialog(Widget screen) {
    assert(
      navigatorKey.currentState != null,
      _assertMessage,
    );
    showAdaptiveDialog(
      context: navigatorKey.currentState!.context,
      barrierColor: ColorManager.primaryPrimary6,
      builder: (context) {
        return screen;
      },
    );
  }

  // Future<dynamic> pushAnimation(Widget page,
  //     {bool replace = false, int transitionNumberType = 1}) async {
  //   Route<Object?> route;
  //
  //   switch (transitionNumberType) {
  //     case 2:
  //       route = KwakCustomTransitionTwo(builder: (c) => page);
  //       break;
  //     default:
  //       route = KwakCustomTransitionOne(builder: (c) => page);
  //   }
  //
  //   return replace
  //       ? await Navigator.pushReplacement(
  //           navigatorKey.currentState!.context, route)
  //       : await Navigator.push(navigatorKey.currentState!.context, route);
  // }

  Future<dynamic> pushReplaceAll(
    Widget page,
  ) async {
    assert(
      navigatorKey.currentState != null,
      _assertMessage,
    );
    return Navigator.of(navigatorKey.currentState!.context).pushAndRemoveUntil(
      route(page),
      (Route<dynamic> route) => false,
    );
  }

  Future<dynamic> pushReplaceAllNamed(
    String newRouteName,
  ) async {
    assert(
      navigatorKey.currentState != null,
      _assertMessage,
    );
    return Navigator.of(navigatorKey.currentState!.context)
        .pushNamedAndRemoveUntil(newRouteName, (route) => false);
  }
}
