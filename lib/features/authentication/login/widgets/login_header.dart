
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.size,
    required this.dark,
  });

  final Size size;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * 0.04),
        Center(
          child: Text(
            AppStrings.appName,
            style: TextStyle(
              fontSize: Theme.of(
                context,
              ).textTheme.headlineLarge?.fontSize,
              fontWeight: Theme.of(
                context,
              ).textTheme.headlineLarge?.fontWeight,
              color: dark ? AppColors.darkPrimary : AppColors.primary,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.07),
        Padding(
          padding: const EdgeInsets.only(left: 9, bottom: 5),
          child: Text(
            AppStrings.loginToYourAccount,
            style: TextStyle(
              fontSize: Theme.of(
                context,
              ).textTheme.headlineSmall?.fontSize,
              fontWeight: Theme.of(
                context,
              ).textTheme.headlineSmall?.fontWeight,
              color: dark ? AppColors.white : AppColors.dark,
            ),
          ),
        ),
      ],
    );
  }
}
