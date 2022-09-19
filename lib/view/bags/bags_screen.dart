import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeta_box_test_app/constant/test_style.dart';
import 'package:zeta_box_test_app/controller/shopping_bag_controller.dart';
import 'package:zeta_box_test_app/view/shipment/shipment_screen.dart';
import 'package:zeta_box_test_app/view/widgets/app_buttons.dart';
import 'package:zeta_box_test_app/view/widgets/detailed_row_botton.dart';
import 'package:zeta_box_test_app/view/widgets/product_card_detailed.dart';

class BagsScreen extends StatelessWidget {
  static const routeName = '/bags';

  const BagsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingBagController>(
      builder: (bagsController) => Scaffold(
        appBar: AppBar(
          title: const Text('BAGS'),
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: ShoppingBagController.find.getAddedProduct.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ProductCardDetailed(
                      productDto: ShoppingBagController.find.getAddedProduct[index],
                      onQuantityChange: (v) => ShoppingBagController.find.updateQuantity(v, index),
                      onCheck: (v) => ShoppingBagController.find.unselectProduct(v, index),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, -5), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const DetailedRowButton(
                  leadingIcon: Icon(Icons.redeem),
                  label: 'USE YOUR PROMO CODE',
                  trailingIcon: Icon(Icons.arrow_forward_ios_outlined),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(thickness: 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'TOTAL PAYEMENT:',
                          style: smallLabel,
                        ),
                        Text(
                          '\$ ${ShoppingBagController.find.sumSelectedProducts.toStringAsFixed(2)}',
                          style: bigLabel,
                        )
                      ],
                    ),
                    AppButtons.elevatePrimary(
                      onPressed: () => Get.toNamed(ShipmentScreen.routeName),
                      width: (Get.width - 80) / 2,
                      title: 'CHECKOUT',
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
