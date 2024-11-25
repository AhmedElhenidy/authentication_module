import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'utils/navigation_routes/bottom_sheet_utils.dart';
import 'utils/navigation_routes/navigation_utils.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! ----------- Core -----------

  getIt.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker(),
  );
  getIt.registerLazySingleton<NavUtils>(
        () => NavUtils(),
  );
  getIt.registerLazySingleton<BottomSheetUtils>(
        () => BottomSheetUtils(navigatorKey: getIt<NavUtils>().navigatorKey),
  );
}