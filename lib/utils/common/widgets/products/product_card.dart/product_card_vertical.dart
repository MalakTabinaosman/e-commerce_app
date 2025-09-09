import 'package:e_commerce_app/utils/common/widgets/products/product_image/product_image.dart';
import 'package:e_commerce_app/utils/common/widgets/texts/product_text.dart';
import 'package:e_commerce_app/utils/constants/app_colors.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunction.isDarkMode(context);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // Navigate to product details page
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 8),
        width: size.width * 0.50,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 128, 127, 127).withOpacity(0.16),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: dark ? AppColors.veryDarkGrey : AppColors.lightGrey,
        ),
        child: Column(
          children: [
            // product image ,sale tag and favorite icon
            Container(
              height: 170,
              // padding: const EdgeInsets.all(.0),
              decoration: BoxDecoration(
                color: dark ? AppColors.veryDarkGrey : AppColors.lightGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  // product image
                  /*Center(
                    child: Image.asset('assets/shoes.png', fit: BoxFit.contain),
                  ),*/
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ProductImage(
                      imageUrl: "assets/shoes.png",
                      applyImageRadius: 15,
                      backgroundColor: dark
                          ? AppColors.darkCard
                          : AppColors.card,
                      borderRadius: 15,
                      padding: const EdgeInsets.all(10.0),
                      height: 150,
                      width: size.width * 0.60,
                      fit: BoxFit.cover,
                      onPressed: () {},
                    ),
                  ),
                  // favorite icon
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 23,
                        ),
                      ),
                    ),
                  ),
                  // sale tag
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: dark
                              ? AppColors.darkSecondary
                              : AppColors.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '20%',
                          style: TextStyle(
                            color: AppColors.darkBackground,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // product details
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // product title
                  ProductText(
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    title: 'Running Shoes',
                    textColor: dark ? Colors.white : AppColors.darkBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  // product brand
                  ProductText(
                    title: "Nike",
                    textColor: dark
                        ? Colors.white.withOpacity(0.7)
                        : Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 5),

                  // product description
                  ProductText(
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    title: 'Nike Air Zoom Pegasus 36 Miami',
                    textColor: dark
                        ? Colors.white.withOpacity(0.7)
                        : Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                  //   const SizedBox(height: 13),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // product price
                      ProductText(
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        title: '\$90.00',
                        textColor: dark
                            ? Colors.white.withOpacity(0.9)
                            : Colors.black,
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: dark
                              ? AppColors.darkSecondary
                              : AppColors.secondary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          color: AppColors.darkBackground,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
