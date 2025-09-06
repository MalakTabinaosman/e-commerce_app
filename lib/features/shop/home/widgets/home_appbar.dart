import 'package:e_commerce_app/utils/common/widgets/appbar/aappbar.dart';
import 'package:e_commerce_app/utils/common/widgets/products/products_cart/cart_counter_icon.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: AAppbar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                color: AppColors.white.withOpacity(0.8),
              ),
            ),

            Row(
              children: [
                Icon(
                  Iconsax.location5,
                  size: 18, // small size so it matches the text
                  color: AppColors.white,
                ),
                SizedBox(width: 4), // small space between icon and text
                Text(
                  "New York, USA",
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.apply(color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
        actions: [CarCounterIcon(onPressed: () {}, color: AppColors.white)],
      ),
    );
  }
}
