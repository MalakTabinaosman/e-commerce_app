import 'package:e_commerce_app/features/shop/home/widgets/circular_container.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(
            top: -150,
            right: -150,
            child: CircularContainer(
              width: 350,
              height: 350,
              padding: 0,
              radius: 480,
              child: null,
              color: AppColors.card.withOpacity(0.06),
              borderColor: Colors.transparent,
            ),
          ),
          Positioned(
            top: 90,
            right: -250,
            child: CircularContainer(
              width: 350,
              height: 350,
              padding: 0,
              radius: 480,
              child: null,
              color: AppColors.card.withOpacity(0.04),
              borderColor: Colors.transparent,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
