import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: AppStrings.email,
              hintText: 'Enter your email',
              contentPadding: EdgeInsets.only(left: 25),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: AppStrings.password,
              hintText: 'Enter your password',
              contentPadding: EdgeInsets.only(left: 25),

              border: const OutlineInputBorder(),
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
              const Text(
                AppStrings.rememberMe,
                style: TextStyle(
                  fontSize: 15.5,
                  color: Color.fromARGB(255, 68, 68, 68),
                ),
              ),
              SizedBox(width: size.width * 0.21),

              TextButton(
                onPressed: () {},
                child: const Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(color: AppColors.primary, fontSize: 13),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.04),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle login action
              },
              child: const Text(AppStrings.login),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width, 50),
                textStyle: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
