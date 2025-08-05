
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';

class loginDivider extends StatelessWidget {
  const loginDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
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
            AppStrings.orLoginInWith,
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

