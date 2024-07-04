import 'package:amrita_ayurvedic_app/core/themes/light_theme.dart';
import 'package:amrita_ayurvedic_app/features/authentication/data/datasource/login_datasource.dart';
import 'package:amrita_ayurvedic_app/features/authentication/data/datasource/login_datasource_impl.dart';
import 'package:amrita_ayurvedic_app/features/authentication/data/repository/login_repository_impl.dart';
import 'package:amrita_ayurvedic_app/features/authentication/domain/repository/login_repository.dart';
import 'package:amrita_ayurvedic_app/features/home/data/datasource/api_datasource.dart';
import 'package:amrita_ayurvedic_app/features/home/data/datasource/api_datasource_impl.dart';
import 'package:amrita_ayurvedic_app/features/home/data/repository/api_repository_impl.dart';
import 'package:amrita_ayurvedic_app/features/home/domain/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void setupDependencies() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<ThemeData>(lightTheme);
  getIt.registerSingleton<LoginDataSource>(LoginDatasourceImpl());
  getIt.registerSingleton<LoginRepository>(
      LoginRepositoryImpl(dataSource: getIt.get<LoginDataSource>()));
  getIt.registerSingleton<ApiDatasource>(ApiDatasourceImpl());
  getIt.registerSingleton<ApiRepository>(
      ApiRepositoryImpl(datasource: getIt.get<ApiDatasource>()));
}

// dataSource: getIt.get<ApiDatasource>()
