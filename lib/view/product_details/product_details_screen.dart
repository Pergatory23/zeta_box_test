import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:zeta_box_test_app/constant/test_style.dart';
import 'package:zeta_box_test_app/model/product.dart';
import 'package:zeta_box_test_app/view/product_details/product_details_controller.dart';
import 'package:zeta_box_test_app/view/widgets/app_buttons.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  static const routeName = '/product-details';

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      builder: (productDetailsController) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: 450,
                child: Stack(
                  children: [
                    Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          product.image ?? 'not provided',
                          height: Get.height / 2,
                          fit: BoxFit.contain,
                        );
                      },
                      itemCount: 1,
                      control: const SwiperControl(),
                      pagination: const SwiperPagination(),
                      containerHeight: 320,
                    ),
                    Positioned(
                      top: -10,
                      left: 10,
                      child: AppButtons.icon(
                        onPressed: () => Get.back(),
                        iconSize: 42,
                        icon: const Icon(Icons.arrow_back),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30).copyWith(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$ ${product.price}',
                      style: normalLabel,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.title?.toUpperCase() ?? 'Not Provided',
                      style: bigLabel,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        product.category?.toUpperCase() ?? 'Not Provided',
                        style: smallWhiteLabel,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'DETAILS',
                        style: normalBoldLabel,
                      ),
                    ),
                    Text(
                      product.description ?? 'Not Provided',
                      textAlign: TextAlign.justify,
                      style: normalPragraph,
                    ),
                    const SizedBox(height: 30),
                    AppButtons.elevatePrimary(
                      onPressed: () => productDetailsController.addToShoppingBag(product),
                      title: 'ADD TO SHOPPING BAG',
                      width: double.infinity,
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
