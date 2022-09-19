import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeta_box_test_app/constant/color_palette.dart';
import 'package:zeta_box_test_app/constant/test_style.dart';
import 'package:zeta_box_test_app/model/product.dart';
import 'package:zeta_box_test_app/view/product_details/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(ProductDetails.routeName, arguments: product),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: neutralColor, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      product.image ?? 'image not provided',
                      height: 150,
                    ),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: double.infinity,
                color: neutralColor,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ${product.price!}',
                      overflow: TextOverflow.ellipsis,
                      style: regularLabel,
                    ),
                    Text(
                      product.title!,
                      overflow: TextOverflow.ellipsis,
                      style: regularLabel,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
