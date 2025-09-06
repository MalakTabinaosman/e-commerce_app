import 'package:e_commerce_app/features/shop/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/home/widgets/curvedEdgesClipperWidget.dart';
import 'package:e_commerce_app/features/shop/home/widgets/home_category_list.dart';
import 'package:e_commerce_app/features/shop/home/widgets/primary_header_container.dart';
import 'package:e_commerce_app/utils/common/widgets/products/product_card.dart/product_card_vertical.dart';
import 'package:e_commerce_app/utils/common/widgets/search_bar/search_bar_container.dart';
import 'package:e_commerce_app/utils/common/widgets/texts/section_heading.dart';
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
          //mainAxisSize: MainAxisSize.min,
          children: [
            CurvedEdgesClipperWidget(
              child: Container(
                height: 340,
                color: dark ? AppColors.darkPrimary : AppColors.primary,
                child: PrimaryHeaderContainer(
                  child: Column(
                    children: [
                      const HomeAppBar(),

                      SizedBox(height: size.height * 0.015),

                      // search bar
                      SearchBarContainer(
                        dark: dark,
                        size: size,
                        text: 'Search for products ...',

                        icon: Iconsax.search_normal_1,
                        icon2: Icons.camera_alt_outlined,
                        showBackGround: true,
                        showBorder: true,
                      ),
                      SizedBox(height: size.height * 0.04),
                      // section heading
                      SectionHeading(
                        dark: dark,
                        size: size,
                        heading: 'Categories',
                        showActionButton: false,
                      ),
                      // categories list
                      CategoriesList(size: size, dark: dark),
                    ],
                  ),
                ),
              ),
            ),

            // section heading
            SizedBox(
              height: size.height * 0.04,
              child: SectionHeading(
                dark: dark,
                size: size,
                heading: 'Popular Products',
                showActionButton: true,
                buttonText: 'View All',
                onPressed: () {},
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 300,
              ),
              itemBuilder: (_, index) {
                return ProductCardVertical();
              },
            ),
          ],
        ),
      ),
    );
  }
}
