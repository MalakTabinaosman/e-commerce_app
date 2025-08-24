import 'package:e_commerce_app/features/shop/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/home/widgets/curvedEdgesClipperWidget.dart';
import 'package:e_commerce_app/features/shop/home/widgets/primary_header_container.dart';
import 'package:e_commerce_app/utils/common/widgets/search_bar/search_bar_container.dart';
import 'package:e_commerce_app/utils/common/widgets/section_heading/section_heading.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedEdgesClipperWidget(
              child: Container(
                height: 300,
                color: dark ? AppColors.darkPrimary : AppColors.primary,
                child: PrimaryHeaderContainer(
                  child: Column(
                    children: [
                      const HomeAppBar(),

                      // search bar
                      SearchBarContainer(
                        dark: dark,
                        size: size,
                        text: 'Search for products ..',

                        icon: Iconsax.search_normal_1,
                        icon2: Icons.camera_alt_outlined,
                        showBackGround: true,
                        showBorder: true,
                      ),
                      SizedBox(height: size.height * 0.03),
                      SectionHeading(
                        dark: dark,
                        size: size,
                        onPressed: () {},
                        heading: 'Categories',
                        buttonText: 'See All',
                      ),
                    ],
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

