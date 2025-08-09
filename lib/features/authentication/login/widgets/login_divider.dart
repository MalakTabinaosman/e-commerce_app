import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Divider(
              color: AppColors.darkGrey,
              thickness: 0.4,
              indent: 60,
              endIndent: 5,
            ),
          ),

          Text(
            text,
            style: TextStyle(color: AppColors.grey, fontSize: 15),
          ),
          Flexible(
            child: Divider(
              color: AppColors.darkGrey,
              thickness: 0.4,
              indent: 5,
              endIndent: 60,
            ),
          ),
        ],
      ),
    );
  }
}
