import 'package:amrita_ayurvedic_app/features/authentication/data/model/login_model.dart';

abstract class LoginDataSource {
  Future<LoginModel> login(String name, String password);
}
