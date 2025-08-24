
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.dark,
    required this.size,
    this.heading,
    this.buttonText,
    required this.onPressed,
  });
  final String? heading, buttonText;
  final VoidCallback onPressed;

  final bool dark;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                heading!,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: dark ? AppColors.white : AppColors.dark,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(width: size.width * 0.03),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  buttonText!,
                  style: TextStyle(
                    color: dark ? AppColors.darkPrimary : AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
