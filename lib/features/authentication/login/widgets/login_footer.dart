import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 0.1),
              // borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: Image.asset(
                'assets/logo/social_media_logos/google_logo.png',
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                // Handle Google login
              },
            ),
          ),
          SizedBox(width: size.width * 0.05),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 0.1),
              //  borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: Image.asset(
                'assets/logo/social_media_logos/facebook_logo.png',
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
              onPressed: () {
                // Handle Facebook login
              },
            ),
          ),
        ],
      ),
    );
  }
}
