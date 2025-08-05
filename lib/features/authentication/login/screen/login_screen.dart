import 'package:e_commerce_app/features/authentication/login/widgets/login_divider.dart';
import 'package:e_commerce_app/features/authentication/login/widgets/login_footer.dart';
import 'package:e_commerce_app/features/authentication/login/widgets/login_form.dart';
import 'package:e_commerce_app/features/authentication/login/widgets/login_header.dart';
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
            top: size.height * 0.1,
            bottom: size.height * 0.05,
            right: size.width * 0.08,
            left: size.width * 0.08,
          ),
          child: Column(
            children: [
              LoginHeader(size: size, dark: dark),
              SizedBox(height: size.height * 0.02),
              const LoginForm(),

              SizedBox(height: size.height * 0.04),
              loginDivider(),
              SizedBox(height: size.height * 0.03),
              LoginFooter(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
