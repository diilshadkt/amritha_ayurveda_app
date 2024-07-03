import 'package:amrita_ayurvedic_app/core/exceptions/base_exception.dart';


class ApiException extends BaseException {
  final String statusCode;
  ApiException({required this.statusCode})
      : super(
            message:
                "Login Failed, check your internet connection and try again. StatusCode: $statusCode");
}
