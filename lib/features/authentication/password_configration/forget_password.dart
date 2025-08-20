import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.05,
          bottom: size.height * 0.02,
          right: size.width * 0.05,
          left: size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            Text(
              AppStrings.forgetPassword,

              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,

                color: isDarkMode ? AppColors.white : AppColors.dark,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              'Enter your email address to receive a link to create a new password via email.',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isDarkMode ? AppColors.darkText : AppColors.text,
              ),
            ),
            SizedBox(height: size.height * 0.04),
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/resetPassword');
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
