import 'package:flutter/material.dart';
import 'package:e_commerce_app/utils/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/utils/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/features/shop/home/widgets/circular_container.dart';

class FeaturedBrandsGrid extends StatelessWidget {
  final bool dark;
  final Size size;

  const FeaturedBrandsGrid({super.key, required this.dark, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeading(
            dark: dark,
            size: size,
            heading: 'Featured Brands',
            showActionButton: true,
            buttonText: 'View All',
            onPressed: () {},
          ),
          const SizedBox(height: 12),
          AppGridLayout(
            itemCount: 6,
            mainAxisExtent: 60,
            itemBuilder: (context, index) {
              return CircularContainer(
                width: size.width,
                height: 60,
                padding: 8,
                radius: 12,
                color: dark ? AppColors.darkCard : AppColors.card,
                borderColor: dark ? AppColors.white : AppColors.darkBackground,
                child: Row(
                  children: [
                    const Icon(
                      Icons.store_mall_directory,
                      size: 40,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  "Brand",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.add_task,
                                size: 12,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '100 Products',
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
