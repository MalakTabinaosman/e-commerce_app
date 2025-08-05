import 'package:e_commerce_app/features/authentication/login/screen/login_screen.dart';
import 'package:e_commerce_app/features/authentication/onboarding/screens/onboarding_screen_1.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen1(nextScreen: LoginScreen(),);
  }
}
