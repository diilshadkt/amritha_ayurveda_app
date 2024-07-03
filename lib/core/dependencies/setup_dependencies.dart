import 'package:amrita_ayurvedic_app/core/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void setupDependencies() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<ThemeData>(lightTheme);
  // getIt.registerSingleton<LoginDataSource>(LoginDataSourceImpl());
  // getIt.registerSingleton<LoginRepository>(
      // LoginRepositoryImpl(dataSource: getIt.get<LoginDataSource>()));
  // getIt.registerSingleton<ApiServicesDataSource>(ApiServicesDataSourceImpl());
  // getIt.registerSingleton<ApiRepository>(
      // ApiRepositoryImpl(dataSource: getIt.get<ApiServicesDataSource>()));
}
