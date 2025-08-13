import 'package:e_commerce_app/features/authentication/success_screens/widgets/verifiaction_animation.dart';
import 'package:e_commerce_app/features/authentication/success_screens/widgets/verification_buttons.dart';
import 'package:e_commerce_app/features/authentication/success_screens/widgets/verification_text.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.07),
              const EmailVerificationAnimation(
                animationPath: 'assets/animation/Success.json',
              ),
              const SizedBox(height: 20),
              const EmailVerificationText(
                title: "Email Verified Successfully",
                subTitle:
                    "Your email address has been verified. You can now sign in and enjoy all the features.",
              ),
              SizedBox(height: size.height * 0.05),
              EmailVerificationButtons(
                onContinue: () {
                  Navigator.pushNamed(context, '/LoginScreen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
