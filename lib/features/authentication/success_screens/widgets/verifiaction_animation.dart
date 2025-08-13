import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';

class EmailVerificationAnimation extends StatelessWidget {
  const EmailVerificationAnimation({super.key, required this.animationPath});
  final String animationPath;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      animationPath,
      width: AppHelperFunction.getScreenWidth(context) * 0.9,
      height: AppHelperFunction.getScreenHeight(context) * 0.5,
    );
  }
}
