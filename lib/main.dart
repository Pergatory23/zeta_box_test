import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeta_box_test_app/controller/shopping_bag_controller.dart';
import 'package:zeta_box_test_app/helpers/theme.dart';
import 'package:zeta_box_test_app/service/network/product_api.dart';
import 'package:zeta_box_test_app/service/repository/product_repository.dart';
import 'package:zeta_box_test_app/service/shared_preferences_service.dart';
import 'package:zeta_box_test_app/view/bags/bags_screen.dart';
import 'package:zeta_box_test_app/view/home/home_controller.dart';
import 'package:zeta_box_test_app/view/home/home_screen.dart';
import 'package:zeta_box_test_app/view/product_details/product_details_controller.dart';
import 'package:zeta_box_test_app/view/product_details/product_details_screen.dart';
import 'package:zeta_box_test_app/view/receipt/receipt_screen.dart';
import 'package:zeta_box_test_app/view/shipment/shipment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      title: 'ZetaBox test app',
      theme: basicTheme(),
      initialRoute: HomeScreen.routeName,
      getPages: [
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
          binding: BindingsBuilder.put(() => HomeController()),
        ),
        GetPage(
          name: ProductDetails.routeName,
          page: () => ProductDetails(product: Get.arguments),
          binding: BindingsBuilder.put(() => ProductDetailsController()),
        ),
        GetPage(
          name: BagsScreen.routeName,
          page: () => const BagsScreen(),
        ),
        GetPage(
          name: ShipmentScreen.routeName,
          page: () => const ShipmentScreen(),
        ),
        GetPage(
          name: ReceiptScreen.routeName,
          page: () => const ReceiptScreen(),
        ),
      ],
    );
  }
}

class InitialBindings implements Bindings {
  @override
  void dependencies() async {
    Get.put<SharedPreferencesService>(SharedPreferencesService(), permanent: true);
    Get.put<ProductApi>(ProductApi(), permanent: true);
    Get.put<ProductRepository>(ProductRepository(), permanent: true);
    Get.put<ShoppingBagController>(ShoppingBagController(), permanent: true);
  }
}
