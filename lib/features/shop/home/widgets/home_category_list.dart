


import 'package:e_commerce_app/utils/common/widgets/category_item/category_item.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.size, required this.dark});

  final Size size;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CategoryItem(
                size: size,
                dark: dark,
                title: 'type',
                image: '1',
                textColor: AppColors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
