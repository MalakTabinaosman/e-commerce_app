import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.size,
    required this.dark,
    this.title,
    this.image,
    required this.textColor,
    this.backgroundColor,
    this.onTap,
  });
  final String? title, image;
  final bool dark;
  final Size size;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(image ?? '', style: TextStyle(color: Colors.black)),
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            title!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: dark ? AppColors.white : AppColors.darkBackground,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
