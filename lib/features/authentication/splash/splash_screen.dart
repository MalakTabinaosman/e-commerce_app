import 'package:e_commerce_app/features/authentication/login/screen/login_screen.dart';
import 'package:e_commerce_app/features/authentication/onboarding/screens/onboarding_screen_1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 6), () {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                OnboardingScreen1(nextScreen: LoginScreen()),
            transitionDuration: const Duration(milliseconds: 900),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Image.asset(
          isDarkMode
              ? 'assets/logo/_SHOPORA_dark.gif'
              : 'assets/logo/SHOPORA.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
