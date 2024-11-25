import 'error_object.dart';

abstract class Failure {
  String? cause;
  String? code;
  List<String>? errors;

  Failure({this.cause, this.code, this.errors});

  ErrorObject when({
    required ErrorObject Function() serverFailure,
    required ErrorObject Function() dataParsingFailure,
    required ErrorObject Function() noConnectionFailure,
    required ErrorObject Function() ambiguousFailure,
    required ErrorObject Function() cacheFailure,
    required ErrorObject Function() loginFailure,
    required ErrorObject Function() imagePickerFailure,
    required ErrorObject Function() paymentFailure,
  }) {
    if (runtimeType == ServerFailure) {
      return serverFailure();
    } else if (runtimeType == ConnectionFailure) {
      return noConnectionFailure();
    } else if (runtimeType == DataParsingFailure) {
      return dataParsingFailure();
    } else if (runtimeType == CacheFailure) {
      return cacheFailure();
    }else if (runtimeType == ImagePickerFailure) {
      return imagePickerFailure();
    }else if (runtimeType == PaymentFailure) {
      return paymentFailure();
    } else {
      return ambiguousFailure();
    }
  }
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({super.cause, super.code, super.errors});
}

class CacheFailure extends Failure {
  CacheFailure({super.cause, super.code, super.errors});
}

class LoginFailure extends Failure {
  LoginFailure({
    super.cause,
    super.code,
  });
}

class AmbiguousFailure extends Failure {
  AmbiguousFailure({
    super.cause,
    super.code,
  });
}

class ConnectionFailure extends Failure {}

class DataParsingFailure extends Failure {
  DataParsingFailure({super.cause, super.code});
}

class ImagePickerFailure extends Failure {
  ImagePickerFailure({super.cause, super.code});
}
class PaymentFailure extends Failure {
  PaymentFailure({super.cause, super.code});
}