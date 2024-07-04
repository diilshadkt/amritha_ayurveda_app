import 'package:amrita_ayurvedic_app/features/authentication/domain/repository/login_repository.dart';
import 'package:amrita_ayurvedic_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:amrita_ayurvedic_app/features/authentication/presentation/provider/login_provider_state.dart';
import 'package:amrita_ayurvedic_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  LoginProviderState _loginState =
      LoginProviderState(isLoading: false, token: '');
  LoginProviderState get loginState => _loginState;

  Future<void> login(BuildContext context, String name, String password) async {
    _loginState = _loginState.copyWith(isLoading: true);
    notifyListeners();
    try {
      final user = await LoginUsecase(
          repository: GetIt.I.get<LoginRepository>())(name, password);
      if (user.token != null) {
        _loginState = _loginState.copyWith(token: user.token!);
        notifyListeners();

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', user.token!);
        Future.sync(
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false),
        );
      }
    } catch (e) {
      Future.sync(
        () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.redAccent,
          ),
        ),
      );
    } finally {
      _loginState = _loginState.copyWith(isLoading: false);
      notifyListeners();
    }
  }
}
