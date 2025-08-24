import 'package:e_commerce_app/bottom_nav_bar.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
            decoration: InputDecoration(
              //labelText: AppStrings.email,
              /* labelStyle: TextStyle(
                color: dark ? AppColors.darkText : AppColors.text,
              ),*/
              hintText: 'Enter your email',
              contentPadding: const EdgeInsets.only(left: 25),
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              //  labelText: AppStrings.password,
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
              SizedBox(width: size.width * 0.09),

              TextButton(
                style: ButtonStyle(
                  surfaceTintColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  splashFactory: NoSplash.splashFactory,
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/ForgetPassword');
                },
                child: const Text(
                  AppStrings.forgotPassword,
                  style: TextStyle(color: AppColors.primary, fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => BottomNavBar()),
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
