import 'package:amrita_ayurvedic_app/core/exceptions/base_exception.dart';

class AuthException extends BaseException {
  final String? error;
  AuthException({this.error})
      : super(
            message: error ??
                "Login Failed with an unknown exception, please try again");
}
