import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Center(
      //title
      child: Text(
        AppStrings.createAccount,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: dark ? AppColors.darkText : AppColors.text,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
