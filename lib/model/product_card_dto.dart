import 'package:zeta_box_test_app/model/product.dart';

class ProductCardDto {
  final Product product;
  int quantity;
  bool? isSelected;

  ProductCardDto({required this.product, this.quantity = 1, this.isSelected = true});

  factory ProductCardDto.fromJson(Map<String, dynamic> json) {
    return ProductCardDto(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
      isSelected: json['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
      'isSelected': isSelected,
    };
  }
}
