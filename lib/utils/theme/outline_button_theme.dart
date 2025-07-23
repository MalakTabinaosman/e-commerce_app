import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.dark,
      side: BorderSide(color: AppColors.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      textStyle: AppTextTheme.lightTextTheme.titleLarge,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
    ),
  );

  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      side: BorderSide(color: AppColors.darkPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      textStyle: AppTextTheme.darkTextTheme.titleLarge,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
    ),
  );
}
