import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.fit,
    required this.applyImageRadius,
    this.border,
    required this.backgroundColor,
    this.padding,
    this.onPressed,
    required this.borderRadius,
  });

  final double? height, width;
  final String imageUrl;
  final BoxFit? fit;
  final int applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(color: backgroundColor, border: border),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(applyImageRadius.toDouble()),

            child: Image.asset(imageUrl, fit: fit ?? BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
