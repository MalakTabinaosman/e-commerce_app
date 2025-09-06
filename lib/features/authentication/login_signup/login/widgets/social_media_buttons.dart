import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey, width: 0.9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            icon: Center(child: Brand(Brands.google)),
            padding: EdgeInsets.zero,

            onPressed: () {
              // Handle Google login
            },
          ),
        ),
        SizedBox(width: size.width * 0.05),
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey, width: 0.9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            icon: Center(
              child: Brand(
                Brands.facebook_f,
                colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
              ),
            ),
            padding: EdgeInsets.zero,

            onPressed: () {
              // Handle Facebook login
            },
          ),
        ),
      ],
    );
  }
}
