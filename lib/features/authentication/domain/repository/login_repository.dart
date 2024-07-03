import 'package:amrita_ayurvedic_app/features/authentication/domain/entity/login_entity.dart';


abstract class LoginRepository {
  Future<LoginEntity> login(String name, String password);
}