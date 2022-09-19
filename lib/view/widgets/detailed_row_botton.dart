import 'package:flutter/material.dart';
import 'package:zeta_box_test_app/constant/color_palette.dart';
import 'package:zeta_box_test_app/constant/test_style.dart';

class DetailedRowButton extends StatelessWidget {
  final Widget leadingIcon;
  final String label;
  final Widget? companyIcon;
  final Widget trailingIcon;

  const DetailedRowButton(
      {Key? key,
      required this.leadingIcon,
      required this.label,
      this.companyIcon,
      required this.trailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: neutralColor.withAlpha(100),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                leadingIcon,
                const SizedBox(width: 20),
                Text(
                  label,
                  style: regularLabel,
                ),
              ],
            ),
            Row(
              children: [
                if (companyIcon != null) companyIcon!,
                const SizedBox(width: 20),
                trailingIcon,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
