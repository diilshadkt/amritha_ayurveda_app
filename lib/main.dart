import 'package:amrita_ayurvedic_app/core/dependencies/setup_dependencies.dart';
import 'package:amrita_ayurvedic_app/features/authentication/presentation/pages/login_page.dart';
import 'package:amrita_ayurvedic_app/features/authentication/presentation/provider/login_provider.dart';
import 'package:amrita_ayurvedic_app/features/home/presentation/provider/branch_provider.dart';
import 'package:amrita_ayurvedic_app/features/home/presentation/provider/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => PatientProvider()),
        ChangeNotifierProvider(create: (context) => BranchProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amrita Aayurvedic App',
      theme: GetIt.I.get<ThemeData>(),
      home: const LoginPage(),
      // context.watch<AuthProvider>().initialWidget,
    );
  }
}
