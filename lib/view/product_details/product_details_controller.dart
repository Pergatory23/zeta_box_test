import 'package:get/get.dart';
import 'package:zeta_box_test_app/controller/shopping_bag_controller.dart';
import 'package:zeta_box_test_app/model/product.dart';
import 'package:zeta_box_test_app/view/bags/bags_screen.dart';

class ProductDetailsController extends GetxController {
  void addToShoppingBag(Product product) {
    ShoppingBagController.find.addProduct(product);
    Get.toNamed(BagsScreen.routeName);
  }
}
