import 'package:e_commerce_app/features/authentication/onboarding/cubit/co_onboarding.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/devices/device_utility.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);

    final controller = Get.put(CoOnboarding());

    return Positioned(
      right: 20,
      top: AppDeviceUtility.getAppBarHeight(),

      child: TextButton(
        onPressed: () {
          controller.skipToLastPage();

          // TODO: Implement skip logic, e.g., navigate to the next screen
        },
        child: Text(
          'Skip',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: dark ? AppColors.darkPrimary : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
