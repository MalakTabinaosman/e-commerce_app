import 'package:e_commerce_app/features/shop/store_screen/widgets/featured_brands_grid.dart';
import 'package:e_commerce_app/features/shop/store_screen/widgets/store_tab_bar.dart';
import 'package:e_commerce_app/utils/common/widgets/appbar/aappbar.dart';
import 'package:e_commerce_app/utils/common/widgets/products/products_cart/cart_counter_icon.dart';
import 'package:e_commerce_app/utils/common/widgets/search_bar/search_bar_container.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AAppbar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: false,
          actions: [CarCounterIcon(onPressed: () {})],
        ),

        body: Column(
          children: [
            // ▸ مربع البحث
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              child: SearchBarContainer(
                size: size,
                text: 'Search for products ...',
                icon: Iconsax.search_normal_1,
                icon2: Icons.camera_alt_outlined,
                showBackGroundColor: dark ? AppColors.darkCard : AppColors.card,
                showBorderColor: dark
                    ? AppColors.white
                    : AppColors.darkBackground,
              ),
            ),

            SizedBox(height: size.height * 0.02),

            // ▸ شبكة البراندات
            FeaturedBrandsGrid(dark: dark, size: size),

            SizedBox(height: size.height * 0.05),

            // ▸ التابات
            StoreTabBar(dark: dark),

            Expanded(
              child: TabBarView(
                children: [
                  _buildTabContent(context, 'All'),
                  _buildTabContent(context, 'Electronics'),
                  _buildTabContent(context, 'Fashion'),
                  _buildTabContent(context, 'Home'),
                  _buildTabContent(context, 'Beauty'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build tab content
  Widget _buildTabContent(BuildContext context, String tabName) {
    return Center(
      child: Text(
        '$tabName Tab Content',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
