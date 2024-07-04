import 'package:amrita_ayurvedic_app/core/constants/login_constants.dart';
import 'package:amrita_ayurvedic_app/core/themes/app_theme.dart';
import 'package:amrita_ayurvedic_app/core/widgets/button_widget.dart';
import 'package:amrita_ayurvedic_app/core/widgets/subtitle_widget.dart';
import 'package:amrita_ayurvedic_app/core/widgets/textfield_widget.dart';
import 'package:amrita_ayurvedic_app/features/authentication/presentation/provider/login_provider.dart';
import 'package:amrita_ayurvedic_app/features/authentication/presentation/widgets/image_widget.dart';
import 'package:amrita_ayurvedic_app/features/authentication/presentation/widgets/title_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    final userController = useTextEditingController();
    final passwordController = useTextEditingController();
    final theme = AppTheme.of(context);
    final appConstants = LoginConstants();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ImageWidget(),
              SizedBox(
                height: theme.spaces.space_400,
              ),
              const TitleWidget(),
              SizedBox(
                height: theme.spaces.space_400,
              ),
              SubTitleWidget(
                title: appConstants.txtuserName,
              ),
              SizedBox(
                height: theme.spaces.space_100,
              ),
              TextFieldWidget(
                controller: userController,
                labelText: appConstants.txtEnterUserName,
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              SubTitleWidget(
                title: appConstants.txtPassword,
              ),
              SizedBox(
                height: theme.spaces.space_100,
              ),
              TextFieldWidget(
                controller: passwordController,
                labelText: appConstants.txtEnterPass,
              ),
              SizedBox(
                height: theme.spaces.space_500 * 1.5,
              ),
              ButtonWidget(
                buttonName: appConstants.txtLogin,
                onPressed: context.watch<LoginProvider>().loginState.isLoading
                    ? null
                    : () {
                        if (userController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          context.read<LoginProvider>().login(context,
                              userController.text, passwordController.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Username and Password can't be empty"),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }
                      },
              )
            ],
          ),
        ),
      ),
    );
  }
}
