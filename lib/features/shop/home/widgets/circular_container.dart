import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    required this.width,
    required this.height,
    required this.padding,
    required this.radius,
    this.child,
    required this.color,
    required this.borderColor,
  });

  final double width;
  final double height;
  final double padding;
  final double radius;
  final Widget? child;
  final Color color, borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: child,
    );
  }
}
