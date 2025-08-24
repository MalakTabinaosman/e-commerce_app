import 'dart:ui';

import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';

class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({
    super.key,
    required this.dark,
    required this.size,
    required this.text,
    required this.icon,
    required this.icon2,
    required this.showBackGround,
    required this.showBorder,
  });
  final String text;
  final IconData icon, icon2;
  final bool showBackGround, showBorder;

  final bool dark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0),
      child: Container(
        width: AppDeviceUtility.getScreenWidth(context),
        padding: EdgeInsets.only(
          top: 6.0,
          bottom: 6.0,
          left: 12.0,
          right: 12.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: showBackGround
              ? (dark ? AppColors.dark : AppColors.white)
              : Colors.transparent,
          border: Border.all(
            color: showBorder
                ? (dark ? AppColors.dark : AppColors.white)
                : Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.darkGrey),
            SizedBox(width: size.width * 0.03),
            Text(
              text,
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              ),
            ),
            SizedBox(width: size.width * 0.26),
            Icon(icon2, color: AppColors.darkGrey),
          ],
        ),
      ),
    );
  }
}
