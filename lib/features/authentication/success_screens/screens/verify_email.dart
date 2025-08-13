import 'package:e_commerce_app/features/authentication/success_screens/widgets/verifiaction_animation.dart';
import 'package:e_commerce_app/features/authentication/success_screens/widgets/verification_buttons.dart';
import 'package:e_commerce_app/features/authentication/success_screens/widgets/verification_text.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
      final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.07),
            const EmailVerificationAnimation(
              animationPath: 'assets/animation/figure_message_sent.json',
            ),
            const SizedBox(height: 20),
            const EmailVerificationText(
              title: "Verify your email",
              subTitle: "We have sent a verification link to your email.",
            ),
            SizedBox(height: size.height * 0.05),
            EmailVerificationButtons(
              onContinue: () {
                // Navigate to the next screen or perform any action
                Navigator.pushNamed(
                  context,
                  '/SuccessScreen',
                ); // Example navigation
              },
              
            ),
            const SizedBox(height: 20),
        SizedBox(
          width: size.width * 0.3,
          child: TextButton(
            onPressed: (){
              
            },
            child: Text(
              "Resend Email",
              style: TextStyle(
                fontSize: 13,
                color: isDarkMode ? AppColors.darkPrimary : AppColors.primary,
              ),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
