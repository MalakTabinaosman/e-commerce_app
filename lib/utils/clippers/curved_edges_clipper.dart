import 'dart:ui';

import 'package:flutter/material.dart';

class CurvedEdgesClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // أول خط مستقيم من الشمال لفوق
    path.lineTo(0, size.height);

    // أول كرف صغير شمال
    final firstCurve = Offset(0, size.height - 25);
    final lastCurve = Offset(30, size.height - 25);
    path.quadraticBezierTo(
      firstCurve.dx,
      firstCurve.dy,
      lastCurve.dx,
      lastCurve.dy,
    );

    // ثاني كرف صغير يمين
    final secondFirstCurve = Offset(0, size.height - 25);
    final secondLastCurve = Offset(size.width - 30, size.height - 25);
    path.quadraticBezierTo(
      secondFirstCurve.dx,
      secondFirstCurve.dy,
      secondLastCurve.dx,
      secondLastCurve.dy,
    );

    // ثالث كرف صغير يمين خالص
    final thirdFirstCurve = Offset(size.width, size.height - 25);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(
      thirdFirstCurve.dx,
      thirdFirstCurve.dy,
      thirdLastCurve.dx,
      thirdLastCurve.dy,
    );

    // خط مستقيم لليمين فوق
    path.lineTo(size.width, 0);

    // قفل الشكل
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
