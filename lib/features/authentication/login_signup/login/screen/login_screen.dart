import 'package:e_commerce_app/features/authentication/login_signup/login/widgets/login_divider.dart';
import 'package:e_commerce_app/features/authentication/login_signup/login/widgets/login_footer.dart';
import 'package:e_commerce_app/features/authentication/login_signup/login/widgets/login_form.dart';
import 'package:e_commerce_app/features/authentication/login_signup/login/widgets/login_header.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: dark ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.08,
            bottom: size.height * 0.02,
            right: size.width * 0.05,
            left: size.width * 0.05,
          ),
          child: Column(
            children: [
              LoginHeader(size: size, dark: dark),
              SizedBox(height: size.height * 0.02),
              const LoginForm(),

              SizedBox(height: size.height * 0.04),
              LoginDivider(text: AppStrings.orLoginInWith),
              SizedBox(height: size.height * 0.01),
              LoginFooter(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
