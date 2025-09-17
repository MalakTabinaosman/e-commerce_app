import 'dart:ui';

import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';

class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({
    super.key,
    required this.size,
    required this.text,
    required this.icon,
    required this.icon2,
    required this.showBackGroundColor,
    required this.showBorderColor,
  });
  final String text;
  final IconData icon, icon2;
  final Color showBackGroundColor, showBorderColor;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 3),
      child: Container(
        height: 40,
        width: AppDeviceUtility.getScreenWidth(context),
        padding: EdgeInsets.only(
          top: 6.0,
          bottom: 6.0,
          left: 12.0,
          right: 12.0,
        ),
        decoration: BoxDecoration(
          color: showBackGroundColor,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: showBorderColor, width: 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.grey),
            SizedBox(width: size.width * 0.04),
            Text(
              text,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
              ),
            ),
            Spacer(),
            Icon(icon2, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
