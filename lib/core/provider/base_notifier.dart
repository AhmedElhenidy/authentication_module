import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/error_object.dart';

part 'base_notifier.freezed.dart';

class BaseNotifier extends ChangeNotifier {
  ProviderState _state = const ProviderState.idle();
  bool _mounted = true;

  bool get mounted => _mounted;

  ProviderState get state => _state;

  void setBusy() => setState(state: const ProviderState.loading());

  void setIdle() => setState();

  void setError(ErrorObject err) => setState(
        state: ProviderState.error(errorCode: err.title, message: err.message),
      );

  void setState({
    ProviderState state = const ProviderState.idle(),
    bool notifyListener = true,
  }) {
    _state = state;
    if (_mounted && notifyListener) {
      notifyListeners();
      // Logger().v('SETSTATE FROM ${this.runtimeType}');
    }
  }

  @override
  void dispose() {
    _mounted = false;
    debugPrint(
      '*************** \n\n -- $runtimeType Provider Has Disposed -- \n\n***************',
    );
    super.dispose();
  }
}

@freezed
class ProviderState with _$ProviderState {
  const factory ProviderState.idle() = Idle;

  const factory ProviderState.loading() = Loading;

  const factory ProviderState.error({String? message, String? errorCode}) =
      Error;
}
