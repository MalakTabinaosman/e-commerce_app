import 'dart:ui';

import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CarCounterIcon extends StatelessWidget {
  const CarCounterIcon({super.key, this.color, required this.onPressed});
  final Color? color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Iconsax.shopping_bag, color: color),
          onPressed: onPressed,
        ),
        Positioned(
          right: 1,
          child: Container(
            width: 18,
            height: 18,
            child: Text(
              "2",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.apply(color: color),
            ),
            decoration: BoxDecoration(
              color: AppColors.darkBackground
              ,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}
