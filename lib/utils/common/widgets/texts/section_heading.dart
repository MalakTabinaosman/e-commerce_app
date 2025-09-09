import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.dark,
    required this.size,
    this.heading,
    this.buttonText,
    this.onPressed,
    this.textColor,
    this.showActionButton = true,
  });

  final String? heading, buttonText;
  final Color? textColor;
  final void Function()? onPressed;
  final bool showActionButton;

  final bool dark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading ?? '',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (showActionButton)
            TextButton(
              onPressed: onPressed,
              child: Text(
                textAlign: TextAlign.right,
                buttonText ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: dark ? AppColors.darkPrimary : AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
