import 'package:e_commerce_app/app.dart';
import 'package:e_commerce_app/utils/theme/app_theme.dart';
import 'package:e_commerce_app/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Shopora());
}

class Shopora extends StatelessWidget {
  const Shopora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: '/home',
    routes: {
      '/home': (context) => App(),
      
    },
      themeMode: ThemeMode.system,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
