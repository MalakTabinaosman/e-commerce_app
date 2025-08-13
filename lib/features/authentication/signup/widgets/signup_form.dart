import 'package:e_commerce_app/features/authentication/privacy_policy/screen/privacy_policy_screen.dart';
import 'package:e_commerce_app/features/authentication/success_screens/screens/verify_email.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignUpForm> {
  bool _obscureText = true;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person, size: 18),

                    hintText: AppStrings.firstName,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.02),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person, size: 18),
                    hintText: AppStrings.lastName,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email, size: 18),
              hintText: AppStrings.email,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone, size: 18),
              hintText: AppStrings.phone,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock, size: 18),
              hintText: AppStrings.password,
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            obscureText: _obscureText,
          ),
          SizedBox(height: size.height * 0.02),

          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
                child: Text(
                  AppStrings.agreeToPrivacyPolicy,
                  style: TextStyle(
                    color: dark ? AppColors.darkText : AppColors.text,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmail()),
              child: Text(
                AppStrings.createAccount,
                style: TextStyle(color: AppColors.darkText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
