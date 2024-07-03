import 'package:amrita_ayurvedic_app/core/constants/api_constants.dart';
import 'package:amrita_ayurvedic_app/core/exceptions/api/api_exception.dart';
import 'package:amrita_ayurvedic_app/features/authentication/data/datasource/login_datasource.dart';
import 'package:amrita_ayurvedic_app/features/authentication/data/model/login_model.dart';
import 'package:dio/dio.dart';

class LoginDatasourceImpl extends LoginDataSource {
  final dio = Dio();
  static const link = ApiConstants.baseUrl;
  static const loginLink = ApiConstants.login;

  @override
  Future<LoginModel> login(String name, String password) async {
    try {
      final data = FormData.fromMap({
        'username': name,
        'password': password,
      });
      final response = await dio.post(link + loginLink, data: data);
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        throw ApiException(statusCode: response.statusCode.toString());
      }
    } on DioException catch (_) {
      rethrow;
    }
  }
}
