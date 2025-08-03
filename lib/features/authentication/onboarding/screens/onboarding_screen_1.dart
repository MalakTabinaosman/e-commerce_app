import 'package:e_commerce_app/features/authentication/onboarding/cubit/co_onboarding.dart';
import 'package:e_commerce_app/features/authentication/onboarding/widget/onboarding_dots_navigation.dart';
import 'package:e_commerce_app/features/authentication/onboarding/widget/onboarding_next_button.dart';
import 'package:e_commerce_app/features/authentication/onboarding/widget/onboarding_skip_button.dart';
import 'package:e_commerce_app/features/authentication/onboarding/widget/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CoOnboarding());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              Onboarding(
                image: 'assets/animation/Shopping.json',
                title: 'Explore Thousands of Products',
                subtitle:
                    'Find everything you need from fashion, electronics, \n and more all in one place',
              ),
              Onboarding(
                image: 'assets/animation/Order_Confirmed.json',
                title: 'Fast and Secure Payments',
                subtitle:
                    'Pay easily using cards, wallets, or cash on delivery \n with end-to-end security',
              ),
              Onboarding(
                image: 'assets/animation/shopping_cart.json',
                title: 'Real-Time Order Tracking',
                subtitle:
                    'Stay updated with every step from purchase \n to delivery at your door',
              ),
            ],
          ),
          const OnboardingSkipButton(),
          OnboardingDotsNavigation(pageController: controller.pageController),
          const OnboardingNextButton(),
        ],
      ),
    );
  }
}
