import 'package:e_commerce_app/app.dart';
import 'package:e_commerce_app/features/authentication/login_signup/login/screen/login_screen.dart';
import 'package:e_commerce_app/features/authentication/password_configration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/password_configration/reset_password.dart';
import 'package:e_commerce_app/features/authentication/login_signup/signup/screen/signup.dart';
import 'package:e_commerce_app/features/authentication/splash/splash_screen.dart';
import 'package:e_commerce_app/features/authentication/success_screens/screens/success_screen.dart';
import 'package:e_commerce_app/features/authentication/success_screens/screens/verify_email.dart';
import 'package:e_commerce_app/utils/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle().copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(const Shopora());
}

class Shopora extends StatefulWidget {
  const Shopora({Key? key}) : super(key: key);

  @override
  State<Shopora> createState() => _ShoporaState();
}

class _ShoporaState extends State<Shopora> {
  @override
  Widget build(BuildContext context) {
    return
    // Uncomment the following lines if you want to use named routes
    GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/resetPassword': (context) => const ResetPassword(),
        '/ForgetPassword': (context) => const ForgetPassword(),
        '/SuccessScreen': (context) => const SuccessScreen(),
        '/VerifyEmail': (context) => const VerifyEmail(),
        '/LoginScreen': (context) => const LoginScreen(),
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
