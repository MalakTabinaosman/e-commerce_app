
import 'package:flutter/material.dart';

class ProductText extends StatelessWidget {
  const ProductText({super.key, required this.title,  required this.textColor, required this.fontSize, required this.fontWeight, required this.maxLines, required this.textAlign});
  final String title;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextAlign textAlign;
  


  @override
  Widget build(BuildContext context) {
    return Text(title,
    style: TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      overflow: TextOverflow.ellipsis,
      
    ),
    textAlign: textAlign,
    maxLines: maxLines,

    );
  }
}