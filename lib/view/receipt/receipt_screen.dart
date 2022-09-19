import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeta_box_test_app/constant/test_style.dart';
import 'package:zeta_box_test_app/constant/urls_images.dart';
import 'package:zeta_box_test_app/controller/shopping_bag_controller.dart';
import 'package:zeta_box_test_app/view/widgets/app_buttons.dart';

class ReceiptScreen extends StatelessWidget {
  static const routeName = '/receipt';

  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingBagController>(
      builder: (bagsController) => Scaffold(
        appBar: AppBar(
          title: const Text('RECEIPT'),
          elevation: 0,
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(
                    visaLogoUrl,
                    width: 200,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SUBTOTAL:',
                      style: normalMediumLabel,
                    ),
                    Text(
                      '\$ 300.00',
                      style: normalMediumLabel,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SHIPMENT SERVICE:',
                      style: normalMediumLabel,
                    ),
                    Text(
                      '\$ 02.50',
                      style: normalMediumLabel,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'DISCOUNT:',
                      style: normalMediumLabel,
                    ),
                    Text(
                      '- \$ 20.00',
                      style: normalMediumRedLabel,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOTAL PAYMENT:',
                      style: normalMediumLabel,
                    ),
                    Text(
                      '\$ ${ShoppingBagController.find.sumSelectedProducts.toStringAsFixed(2)}',
                      style: bigLabel,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
          child: AppButtons.elevatePrimary(
            onPressed: () {},
            title: 'PAY NOW',
          ),
        ),
      ),
    );
  }
}
