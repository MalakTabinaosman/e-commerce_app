import 'package:e_commerce_app/features/authentication/login_signup/login/widgets/social_media_buttons.dart';
import 'package:e_commerce_app/features/authentication/login_signup/signup/screen/signup.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginFooter extends StatefulWidget {
  const LoginFooter({super.key, required this.size});
  final Size size;

  @override
  State<LoginFooter> createState() => _LoginFooterState();
}

class _LoginFooterState extends State<LoginFooter> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          SocialMediaButtons(size: size),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.dontHaveAccount,
                style: TextStyle(color: AppColors.grey, fontSize: 16),
              ),
              // SizedBox(width: size.width * 0.01),
              TextButton(
                style: ButtonStyle(
                  surfaceTintColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  splashFactory: NoSplash.splashFactory,
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                ),
                onPressed: () {
                  Get.offAll(() => Signup());
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
