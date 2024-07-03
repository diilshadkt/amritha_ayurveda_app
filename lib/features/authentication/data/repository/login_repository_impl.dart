import 'package:amrita_ayurvedic_app/features/authentication/data/datasource/login_datasource.dart';
import 'package:amrita_ayurvedic_app/features/authentication/domain/entity/login_entity.dart';
import 'package:amrita_ayurvedic_app/features/authentication/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource dataSource;
  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<LoginEntity> login(String name, String password) async {
    final data = await dataSource.login(name, password);

    final results = LoginEntity(
        status: data.status,
        message: data.message,
        token: data.token,
        isSuperuser: data.isSuperuser);
    return results;
  }
}
