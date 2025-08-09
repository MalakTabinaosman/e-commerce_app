import 'package:e_commerce_app/features/authentication/privacy_policy/widget/bottom_wave_clipper.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart'; // إضافة هنا

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: dark ? AppColors.darkPrimary : AppColors.primary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath(
                clipper: BottomWaveClipper(),
                child: Image.asset(
                  "assets/policy_privacy.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: dark ? AppColors.darkText : AppColors.text,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text: "Last updated: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: "August 8, 2025\n\n"),
                    TextSpan(
                      text: "1. Introduction\n",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: dark ? AppColors.darkPrimary : AppColors.primary,
                      ),
                    ),
                    const TextSpan(
                      text:
                          "Welcome to our e-commerce app. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your information.\n\n",
                    ),
                    TextSpan(
                      text: "2. Information We Collect\n",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: dark ? AppColors.darkPrimary : AppColors.primary,
                      ),
                    ),
                    const TextSpan(
                      text:
                          "- Personal information (name, email, phone)\n- Payment details\n- Delivery address\n- Order history\n\n",
                    ),
                    TextSpan(
                      text: "3. How We Use Your Information\n",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: dark ? AppColors.darkPrimary : AppColors.primary,
                      ),
                    ),
                    const TextSpan(
                      text:
                          "- Process your orders\n- Improve our services\n- Communicate with you about orders and promotions\n\n",
                    ),
                    TextSpan(
                      text: "4. Contact Us\n",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: dark ? AppColors.darkPrimary : AppColors.primary,
                      ),
                    ),
                    const TextSpan(
                      text: "If you have any questions, please email us at ",
                    ),
                    TextSpan(
                      text: "malaktabinaosman@gmail.com",
                      style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          final Uri emailUri = Uri(
                            scheme: 'mailto',
                            path: 'malaktabinaosman@gmail.com',
                            queryParameters: {
                              'subject': 'Privacy Policy Inquiry',
                              'body':
                                  'Hello, I have a question about your privacy policy.',
                            },
                          );

                          if (await canLaunchUrl(emailUri)) {
                            await launchUrl(
                              emailUri,
                              mode: LaunchMode.externalApplication, // مهم
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "No email application found on this device.",
                                ),
                              ),
                            );
                          }
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
