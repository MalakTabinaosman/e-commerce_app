import 'package:e_commerce_app/features/authentication/login_signup/login/widgets/login_divider.dart';
import 'package:e_commerce_app/features/authentication/login_signup/login/widgets/social_media_buttons.dart';
import 'package:e_commerce_app/features/authentication/login_signup/signup/widgets/signup_form.dart';
import 'package:e_commerce_app/features/authentication/login_signup/signup/widgets/signup_header.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SignUpHeader(dark: dark),
              SizedBox(height: size.height * 0.05),
              //form
              SignUpForm(),

              SizedBox(height: size.height * 0.03),
              LoginDivider(text: AppStrings.orSigninUpWith),
              SizedBox(height: size.height * 0.03),
              SocialMediaButtons(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
