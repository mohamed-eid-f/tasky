import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tasky/core/theme/app_theme.dart';
// import 'package:tasky/features/auth/presentation/pages/login_screen.dart';
import 'core/presentation/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasky',
      theme: appThemeData,
      home: const SplashScreen(),
    );
  }
}
