import 'package:e_commerce_app/app.dart';
import 'package:e_commerce_app/features/authentication/signup/screen/signup.dart';
import 'package:e_commerce_app/features/authentication/splash/splash_screen.dart';
import 'package:e_commerce_app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const Shopora());
}

class Shopora extends StatelessWidget {
  const Shopora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    // Uncomment the following lines if you want to use named routes
    GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const App(),
        '/signup': (context) => const Signup(),
      },
      themeMode: ThemeMode.system,
      theme: AppThemeData.lightTheme,
      darkTheme: AppThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
