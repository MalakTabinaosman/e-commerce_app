import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';

class StoreTabBar extends StatelessWidget {
  final bool dark;
  const StoreTabBar({super.key, required this.dark});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.zero,
        labelColor: AppColors.primary,
        unselectedLabelColor:
            dark ? AppColors.white : AppColors.darkBackground,
        indicatorColor: AppColors.primary,
        tabs: const [
          Tab(text: 'All'),
          Tab(text: 'Electronics'),
          Tab(text: 'Fashion'),
          Tab(text: 'Home'),
          Tab(text: 'Beauty'),
        ],
      ),
    );
  }
}
