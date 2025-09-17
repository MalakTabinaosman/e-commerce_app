import 'package:e_commerce_app/utils/common/widgets/appbar/aappbar.dart';
import 'package:e_commerce_app/utils/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/utils/common/widgets/products/product_card.dart/product_card_vertical.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppbar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppGridLayout(
                itemCount: 10,
                itemBuilder: (BuildContext, int) {
                  return ProductCardVertical();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
