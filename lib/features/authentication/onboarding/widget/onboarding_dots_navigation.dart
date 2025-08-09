import 'package:e_commerce_app/features/authentication/onboarding/cubit/co_onboarding.dart';
import 'package:e_commerce_app/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotsNavigation extends StatelessWidget {
  const OnboardingDotsNavigation({
    super.key,
    required PageController pageController,
  });

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.find<CoOnboarding>();
    return Positioned(
      bottom: AppDeviceUtility.getBottomNavigationBarHight() + 25,
      left: 40,

      child: SmoothPageIndicator(
        controller: onboardingController
            .pageController, // Use the PageController from CoOnboarding
        count: 3,
        effect: ExpandingDotsEffect(
          dotHeight: 6,
          dotWidth: 12,
          activeDotColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
