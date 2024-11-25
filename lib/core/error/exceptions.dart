import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class ServerException implements Exception {
  Response<dynamic>? response;

  ServerException(this.response);

  @override
  String toString() {
    String errorMessage = 'Server Error!';
    try {
      if (response?.data is Map) {
        if (response?.data['errorCode'] != null) {
          errorMessage = response?.data['errorCode']=='ValidationErrorCode'?
          (response?.data['errors'] as List).first:
              response!.data['errorCode'].toString();
          // if the error is not mapped then return the server message
          if(errorMessage==response!.data['errorCode'].toString()){
            errorMessage = (response!.data['errors'] as List).first;
          }
        } else if (response?.data['errors'] is List) {
          final List<dynamic> errors = response?.data['errors'] as List;
          errorMessage = '';
          for (var e in errors) {
            errorMessage =
                '$errorMessage ${e as String}\n';
          }
          if (errorMessage == '') {
            errorMessage = 'Server Error!';
          }
        } else if (response?.data['message'] != null) {
          errorMessage =
              response?.data['message']?.toString() ?? 'ERROR MESSAGE';
        }
      } else if (response?.statusMessage.toString() != 'null') {
        errorMessage = response?.statusMessage?.toString() ?? 'ERROR';
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return errorMessage;
  }
}

class CacheException implements Exception {
  String key;

  CacheException(this.key);

  @override
  String toString() {
    return 'Server Error! with key: $key';
  }
}

class DataParsingException implements Exception {
  final String cause;

  DataParsingException(this.cause);
}

class LoginException implements Exception {
  final String cause;

  LoginException(this.cause);
}

class ImagePickerException implements Exception {
  final String cause;

  ImagePickerException(this.cause);
}

class PaymentException implements Exception {
  final String cause;

  PaymentException(this.cause);
}
