import 'package:amrita_ayurvedic_app/core/widgets/splash_screen_widget.dart';
import 'package:amrita_ayurvedic_app/features/authentication/presentation/pages/login_page.dart';
import 'package:amrita_ayurvedic_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Widget _initialWidget = const SplashSrceen();
  Widget get initialWidget => _initialWidget;
  void authRedirect(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 3));
    if (prefs.getString("token") != null) {
      _initialWidget = const HomePage();
      notifyListeners();
    } else {
      _initialWidget = const LoginPage();
      notifyListeners();
    }
  }
}
