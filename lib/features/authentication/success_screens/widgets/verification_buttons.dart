import 'package:flutter/material.dart';

class EmailVerificationButtons extends StatelessWidget {
  const EmailVerificationButtons({super.key, this.onContinue, this.onResend});
  final VoidCallback? onContinue;
  final VoidCallback? onResend;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: size.width * 0.7,
          child: ElevatedButton(
            onPressed: onContinue,
            child: const Text("Continue"),
          ),
        ),
      ],
    );
  }
}
