import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'core/common-widgets/app_layout.dart';
import 'core/get_it_injection.dart';
import 'core/utils/locale_info.dart';
import 'core/utils/extensions/screen_util_extensions.dart';
import 'core/utils/navigation_routes/navigation_utils.dart';
import 'core/utils/style/text_manager.dart';
import 'core/utils/style/theme_manager.dart';
import 'features/authentication_feature/presentation/providers/authentication_provider.dart';
import 'features/authentication_feature/presentation/screens/identity_number_screen.dart';


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //
    //* EasyLocalization
    //
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [
          LanguageManager.arabicLocal,
          LanguageManager.englishLocal,
        ],
        path: LanguageManager.assetsPathLocalisations,
        fallbackLocale: LanguageManager.arabicLocal,
        saveLocale: true,
        //
        //* OverlaySupport
        //
        child: OverlaySupport.global(
          //
          //* ScreenUtilInit
          //
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            useInheritedMediaQuery: true,
            enableScaleWH: () {
              if (ScreenUtil().deviceType(context) == DeviceType.mobile) {
                return false;
              }
              return true;
            },
            fontSizeResolver: (fontSize, instance) {
              double aspectRatio =
                  ScreenUtil().screenWidth / ScreenUtil().screenHeight;
              if (aspectRatio > 1.5) {
                // For wider screens (e.g., foldable devices), reduce the font size slightly
                return fontSize * 0.95;
              } else if (ScreenUtil().isBiggerThanMobileScreen) {
                return fontSize * 1.5;
              } else {
                // For narrower screens, keep the font size as is or adjust as needed
                return fontSize.toDouble();
              }
            },

            // splitScreenMode: true,
            //
            //* MaterialApp
            //
            builder: (context, child) => MaterialApp(
              localizationsDelegates: [
                ...context.localizationDelegates,
                FormBuilderLocalizations.delegate,
              ],
              builder: (context, child) {
                AppLocaleInfo.instance.setLocale(context.locale);

                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: TextScaler.noScaling),
                  child: AppLayout(child: child!),
                );
              },
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Tameeni',
              debugShowCheckedModeBanner: false,
              theme: getTameeniTheme(),
              navigatorKey: getIt<NavUtils>().navigatorKey,
              home: const IdentityNumberScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
