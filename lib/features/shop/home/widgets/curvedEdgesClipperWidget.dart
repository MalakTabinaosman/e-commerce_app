








import 'package:e_commerce_app/features/shop/home/widgets/circular_container.dart';
import 'package:e_commerce_app/utils/clippers/curved_edges_clipper.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CurvedEdgesClipperWidget extends StatelessWidget {
  const CurvedEdgesClipperWidget({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedEdgesClipper(),
      child: Container(
        height: 300,
        color: dark ? AppColors.darkPrimary : AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -150,
                child: CircularContainer(
                  width: 350,
                  height: 350,
                  padding: 0,
                  radius: 480,
                  child: null,
                  color: AppColors.card.withOpacity(0.06),
                ),
              ),
              Positioned(
                top: 90,
                right: -250,
                child: CircularContainer(
                  width: 350,
                  height: 350,
                  padding: 0,
                  radius: 480,
                  child: null,
                  color: AppColors.card.withOpacity(0.04),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
