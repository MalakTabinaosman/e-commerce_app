import 'package:e_commerce_app/features/shop/home/widgets/curvedEdgesClipperWidget.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedEdgesClipperWidget(dark: dark),
          ],
        ),
      ),
    );
  }
}

