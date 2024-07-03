import 'package:amrita_ayurvedic_app/core/exceptions/auth/auth_exception.dart';
import 'package:amrita_ayurvedic_app/features/authentication/domain/entity/login_entity.dart';
import 'package:amrita_ayurvedic_app/features/authentication/domain/repository/login_repository.dart';

final class LoginUsecase {
  final LoginRepository repository;
  LoginUsecase({required this.repository});

  Future<LoginEntity> call(String name, String password) async {
    try {
      LoginEntity user = await repository.login(name, password);
      if (user.token != null) {
        return user;
      } else {
        throw AuthException(error: user.message);
      }
    } catch (e) {
      rethrow;
    }
  }
}
