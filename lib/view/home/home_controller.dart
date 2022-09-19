import 'package:get/get.dart';
import 'package:zeta_box_test_app/model/product.dart';
import 'package:zeta_box_test_app/service/repository/product_repository.dart';

class HomeController extends GetxController {
  List<String> listTextTabToggle = List.of(['MAN', 'WOMAN']); // 0 for man and 1 for woman
  List<String?> categoryList = [];
  List<Product> productList = [];
  List<Product> filteredProductList = [];
  int currentIndex = 0;
  int genderSelected = 0;
  int categorySelected = 0;

  HomeController() {
    _init();
  }

  Future<void> _init() async {
    productList = await ProductRepository.find.getAllProducts();
    categoryList = [
      'ALL',
      ...productList.map((product) => product.category?.toUpperCase()).toSet().toList()
    ];
    update();
  }

  void selectTab(int value) {
    currentIndex = value;
    update();
  }

  selectGender(int genderIndex) {
    genderSelected = genderIndex;
    filteredProductList = productList
        .where((product) =>
            genderSelected == 1 ? _isProductForWoman(product) : !_isProductForWoman(product))
        .toList();
    update();
  }

  selectCategory(int index) {
    categorySelected = index;
    if (categoryList[index]?.contains('ALL') ?? false) {
      filteredProductList.clear();
      update();
      return;
    }
    if ((categoryList[index]?.contains('WOMEN') ?? false) ||
        (categoryList[index]?.contains('JEWELERY') ?? false)) {
      genderSelected = 1;
    } else {
      genderSelected = 0;
    }
    filteredProductList = productList
        .where((product) => product.category?.toUpperCase() == categoryList[index])
        .toList();
    update();
  }

  bool _isProductForWoman(Product product) =>
      (product.category?.toUpperCase().contains('WOMEN') ?? false) ||
      (product.category?.toUpperCase().contains('JEWELERY') ?? false);
}
