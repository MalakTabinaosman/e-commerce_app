import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static final ChipThemeData lightChipTheme = ChipThemeData(
    selectedColor: AppColors.primary,
    disabledColor: AppColors.darkBackground,
    labelStyle: TextStyle(color: AppColors.text),
    checkmarkColor: AppColors.white,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  );

  static final ChipThemeData darkChipTheme = ChipThemeData(
    selectedColor: AppColors.darkPrimary,
    disabledColor: AppColors.darkBackground,
    labelStyle: TextStyle(color: AppColors.white),
    checkmarkColor: AppColors.white,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  );
}
