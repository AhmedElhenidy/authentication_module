import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../enums/toast_type.dart';
import '../error/error_object.dart';
import '../error/failures.dart';
import 'navigation_routes/overlay_utils.dart';

class UIUtils {
  static void removeKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static void errorStateHandler(Failure l) {
    debugPrint(
      ErrorObject.mapFailureToErrorObject(failure: l).message,
    );
    OverlayUtils.showToast(
      ErrorObject.mapFailureToErrorObject(failure: l).message,
      ToastType.failure,
    );
  }
}
