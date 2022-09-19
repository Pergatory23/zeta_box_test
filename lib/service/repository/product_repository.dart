import 'package:get/get.dart';
import 'package:zeta_box_test_app/model/product.dart';
import 'package:zeta_box_test_app/service/network/product_api.dart';

class ProductRepository extends GetxService {
  static ProductRepository get find => Get.find<ProductRepository>();

  Future<List<Product>> getAllProducts() async {
    try {
      final response = await ProductApi.find.getProduct();
      return (response as List).map((product) => Product.fromJson(product)).toList();
    } catch (error) {
      // Add Exception and logging
    }
    return [];
  }
}
