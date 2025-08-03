import 'package:e_commerce_app/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24,
      bottom: AppDeviceUtility.getBottomNavigationBarHight() + 20,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: () {},
        child: Icon(Iconsax.arrow_right_3, color: Colors.white),
      ),
    );
  }
}