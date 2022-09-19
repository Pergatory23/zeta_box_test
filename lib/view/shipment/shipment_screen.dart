import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeta_box_test_app/constant/test_style.dart';
import 'package:zeta_box_test_app/constant/urls_images.dart';
import 'package:zeta_box_test_app/controller/shopping_bag_controller.dart';
import 'package:zeta_box_test_app/view/receipt/receipt_screen.dart';
import 'package:zeta_box_test_app/view/widgets/app_buttons.dart';
import 'package:zeta_box_test_app/view/widgets/detailed_row_botton.dart';
import 'package:zeta_box_test_app/view/widgets/product_card_detailed.dart';

class ShipmentScreen extends StatelessWidget {
  static const routeName = '/shipment';

  const ShipmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingBagController>(
      builder: (shipmentController) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'SHIPMENT',
          ),
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SHIPMENT LOCATION',
                      style: normalBoldLabel,
                    ),
                    AppButtons.text(
                        onPressed: () {}, title: 'CHANGE LOCATION', titleStyle: smallRedLabel),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'STUDIO',
                  style: normalBoldLabel,
                ),
                const SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: smallPragraph,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(thickness: 2),
                ),
                DetailedRowButton(
                  leadingIcon: const Icon(Icons.local_shipping),
                  label: 'SHIPMENT',
                  companyIcon: Image.asset(
                    fedExLogoUrl,
                    height: 30,
                  ),
                  trailingIcon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
                const SizedBox(height: 20),
                DetailedRowButton(
                  leadingIcon: const Icon(Icons.money),
                  label: 'PAYMENT',
                  companyIcon: Image.asset(
                    visaLogoUrl,
                    height: 50,
                  ),
                  trailingIcon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'PRODUCTS',
                    style: normalBoldLabel,
                  ),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: ShoppingBagController.find.getSelectedProduct.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ProductCardDetailed(
                      productDto: ShoppingBagController.find.getSelectedProduct[index],
                      onQuantityChange: (v) => ShoppingBagController.find.updateQuantity(v, index),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    onPressed: () => Get.toNamed(ReceiptScreen.routeName),
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
    );
  }
}
