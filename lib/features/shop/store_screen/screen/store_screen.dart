import 'package:e_commerce_app/utils/common/widgets/appbar/aappbar.dart';
import 'package:e_commerce_app/utils/common/widgets/products/products_cart/cart_counter_icon.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppbar(
        title: const Text('Store'),
        showBackArrow: false,
        actions: [CarCounterIcon(onPressed: () {})],
      ),
    );
  }
}
