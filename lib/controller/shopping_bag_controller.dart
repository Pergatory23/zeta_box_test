import 'dart:convert';

import 'package:get/get.dart';
import 'package:zeta_box_test_app/model/product.dart';
import 'package:zeta_box_test_app/model/product_card_dto.dart';
import 'package:zeta_box_test_app/service/shared_preferences_service.dart';

class ShoppingBagController extends GetxController {
  final List<ProductCardDto> _addedProducts = [];

  static ShoppingBagController get find => Get.find<ShoppingBagController>();

  List<ProductCardDto> get getAddedProduct => _addedProducts;

  List<ProductCardDto> get getSelectedProduct => _addedProducts.where((element) => element.isSelected ?? false).toList();

  double get sumSelectedProducts {
    double result = 0;
    for (ProductCardDto productDto in _addedProducts) {
      result += productDto.isSelected ?? false ? productDto.product.price! * productDto.quantity : 0;
    }
    return result;
  }

  void addProduct(Product product) {
    if (_addedProducts.where((element) => element.product.id == product.id).isEmpty) {
      _addedProducts.add(ProductCardDto(product: product));
      _updateSharedPreferences();
    } else {
      null;
    }
  }

  void _updateSharedPreferences() {
    SharedPreferencesService.find
        .add('savedProduct', json.encode(_addedProducts.map((e) => e.toJson()).toList()));
  }

  ShoppingBagController() {
    _init();
  }

  Future<void> _init() async {
    String? jsonProductList = await SharedPreferencesService.find.get('savedProduct');
    if (jsonProductList != null) {
      _addedProducts.addAll((json.decode(jsonProductList) as List)
          .map((productJson) => ProductCardDto.fromJson(productJson))
          .toList());
    }
  }

  void unselectProduct(bool value, int index) {
      _addedProducts[index].isSelected = value;
    _updateSharedPreferences();
    update();
  }

  updateQuantity(int value, int index) {
    if (value > 0) {
      _addedProducts[index].quantity = value;
      _updateSharedPreferences();
      update();
    }
  }
}
