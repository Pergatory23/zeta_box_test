import 'package:flutter/material.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:zeta_box_test_app/constant/test_style.dart';
import 'package:zeta_box_test_app/model/product_card_dto.dart';
import 'package:zeta_box_test_app/view/widgets/app_buttons.dart';

class ProductCardDetailed extends StatelessWidget {
  final ProductCardDto productDto;
  final void Function(bool)? onCheck;
  final void Function(int) onQuantityChange;

  const ProductCardDetailed(
      {Key? key, required this.productDto, this.onCheck, required this.onQuantityChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (productDto.isSelected != null && onCheck != null)
          CustomCheckBox(
            value: productDto.isSelected!,
            shouldShowBorder: true,
            // borderColor: Colors.red,
            checkedFillColor: Colors.black,
            borderRadius: 8,
            borderWidth: 1,
            checkBoxSize: 22,
            onChanged: onCheck!,
          ),
        Image.network(
          productDto.product.image ?? 'image not provided',
          height: 120,
          width: 100,
          fit: BoxFit.contain,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '\$ ${productDto.product.price}',
                  style: regularBoldLabel,
                ),
                const SizedBox(height: 5),
                Text(
                  productDto.product.title?.toUpperCase() ?? 'Not Provided',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: normalBoldLabel,
                ),
                Row(
                  children: [
                    AppButtons.iconWithBackground(
                      padding: 0,
                      onPressed: () => onQuantityChange(productDto.quantity + 1),
                      buttonColor: Colors.black,
                      icon: const Icon(Icons.add),
                    ),
                    Text(
                      productDto.quantity.toString(),
                      style: normalBoldLabel,
                    ),
                    AppButtons.iconWithBackground(
                      padding: 0,
                      onPressed: () => onQuantityChange(productDto.quantity - 1),
                      buttonColor: Colors.white,
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Size:',
                      style: normalNeutralLabel,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'L',
                      style: normalLabel,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
