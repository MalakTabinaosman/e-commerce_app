import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
      disabledForegroundColor: Colors.white.withOpacity(0.5),
      side: const BorderSide(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      textStyle: AppTextTheme.lightTextTheme.titleLarge,
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(
      elevation: 1,
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: Colors.white,
      disabledBackgroundColor: AppColors.darkPrimary.withOpacity(0.5),
      disabledForegroundColor: Colors.white.withOpacity(0.5),
      side: const BorderSide(color: AppColors.darkPrimary),
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      textStyle: AppTextTheme.darkTextTheme.titleLarge,
    ),
  );
}
