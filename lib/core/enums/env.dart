// ignore_for_file: constant_identifier_names
// static const uat = 'https://policyuat.gettameeni.com/';
// static const dev = 'https://devmotor.gettameeni.com/';
// static const preProd = 'https://premotor.tameeni.com/';
// static const health = 'https://health.tameeni.com/';
// static const travel = 'https://traveluat.gettameeni.com/';

enum ENV { PREPROD, PROD, QC, DEV }

extension EnvExtension on ENV {
  static const preProd = 'https://premotor.tameeni.com/';
  static const qc = 'https://qcmotor.gettameeni.com/';
  static const dev = 'https://devmotor.gettameeni.com/';
  static const prod = 'https://www.tameeni.com/';
  static const urlVersion = 'motor/api/V1/';

  bool get isCrashlyticsEnabled {
    switch (this) {
      case ENV.PROD:
        return true;
      case ENV.QC:
      case ENV.DEV:
        return false;
      case ENV.PREPROD:
        return false;
      default:
        throw UnsupportedError('Unsupported environment: $this');
    }
  }

  String getCertFileName() {
    switch (this) {
      case ENV.PROD:
        return '_.tameeni.com.pem';
      case ENV.QC:
      case ENV.DEV:
        return '_.gettameeni.com.pem';
      case ENV.PREPROD:
        return '';
      default:
        throw UnsupportedError('Unsupported environment: $this');
    }
  }

  String getClientCertFileName() {
    switch (this) {
      case ENV.PROD:
        return '_.tameeni.com.pem';
      case ENV.QC:
      case ENV.DEV:
        return 'newcert.cer';
      case ENV.PREPROD:
        return '';
      default:
        throw UnsupportedError('Unsupported environment: $this');
    }
  }

  String getClientCertKeyFileName() {
    switch (this) {
      case ENV.PROD:
        return '_.tameeni.com.pem';
      case ENV.QC:
      case ENV.DEV:
        return 'newcert.key';
      case ENV.PREPROD:
        return '';
      default:
        throw UnsupportedError('Unsupported environment: $this');
    }
  }

  String get baseUrl {
    if (this == ENV.QC) {
      return qc;
    } else if (this == ENV.DEV) {
      return dev;
    } else if (this == ENV.PREPROD) {
      return preProd;
    } else {
      return prod;
    }
    // return this == ENV.DEV ? qc : prod;
  }

  String get baseVersion {
    return urlVersion;
  }

  bool get enableSecurity {
    return true;
    return this == ENV.PROD ? true : false;
  }
}
