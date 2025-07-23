import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/theme/app_bar_theme.dart';
import 'package:e_commerce_app/utils/theme/checkbox_theme.dart';
import 'package:e_commerce_app/utils/theme/chip_theme.dart';
import 'package:e_commerce_app/utils/theme/elevated_button_theme.dart';
import 'package:e_commerce_app/utils/theme/outline_button_theme.dart';
import 'package:e_commerce_app/utils/theme/text_field_theme.dart';
import 'package:e_commerce_app/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: AppTextTheme.lightTextTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
    chipTheme: TChipTheme.lightChipTheme,
appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckBoxTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,



    
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness:Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: AppTextTheme.darkTextTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckBoxTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
  );
}
