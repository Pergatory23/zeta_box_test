import 'package:flutter/material.dart';
import 'package:zeta_box_test_app/constant/color_palette.dart';
import 'package:zeta_box_test_app/constant/test_style.dart';

enum ButtonType { elevatePrimary, elevateSecondary, text, icon, iconWithBackground }

// ignore: must_be_immutable
class AppButtons extends StatelessWidget {
  final ButtonType? buttonType;
  final VoidCallback onPressed;
  final String? title;
  final TextStyle? titleStyle;
  final Widget? child;
  double? width;
  final bool loading;
  final bool disabled;
  final Icon? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? buttonColor;
  final Size? minimumSize;
  final double? padding;
  final bool withBorder;

  AppButtons.elevatePrimary({
    Key? key,
    required this.onPressed,
    this.title,
    this.titleStyle,
    this.child,
    this.width,
    this.loading = false,
    this.disabled = false,
    this.buttonColor,
  })  : buttonType = ButtonType.elevatePrimary,
        icon = null,
        iconSize = null,
        iconColor = null,
        minimumSize = null,
        padding = null,
        withBorder = false,
        super(key: key);

  AppButtons.elevateSecondary({
    Key? key,
    required this.onPressed,
    this.title,
    this.titleStyle,
    this.child,
    this.width,
    this.loading = false,
    this.disabled = false,
    this.icon,
  })  : buttonType = ButtonType.elevateSecondary,
        iconSize = null,
        iconColor = null,
        buttonColor = null,
        minimumSize = null,
        padding = null,
        withBorder = false,
        super(key: key);

  AppButtons.text({
    Key? key,
    required this.onPressed,
    this.title,
    this.titleStyle,
    this.child,
    this.disabled = false,
    this.minimumSize,
  })  : assert(title != null || child != null, 'Text button should have a title or a child!'),
        buttonType = ButtonType.text,
        loading = false,
        icon = null,
        width = null,
        iconSize = null,
        iconColor = null,
        buttonColor = null,
        padding = null,
        withBorder = false,
        super(key: key);

  AppButtons.icon({
    Key? key,
    required this.onPressed,
    this.disabled = false,
    required this.icon,
    this.iconSize,
    this.iconColor,
    this.withBorder = false,
  })  : assert(icon != null, 'Icon button should have an icon'),
        buttonType = ButtonType.icon,
        child = null,
        title = null,
        titleStyle = null,
        width = null,
        loading = false,
        buttonColor = null,
        minimumSize = null,
        padding = null,
        super(key: key);

  AppButtons.iconWithBackground({
    Key? key,
    required this.onPressed,
    this.disabled = false,
    this.icon,
    this.buttonColor,
    this.padding,
    this.child,
  })  : assert(icon != null || child != null,
            'Icon with background button should have an icon or a child'),
        buttonType = ButtonType.iconWithBackground,
        title = null,
        titleStyle = null,
        width = null,
        loading = false,
        iconSize = null,
        iconColor = null,
        minimumSize = null,
        withBorder = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.elevatePrimary:
        return ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(
              width ?? 100,
              50,
            )),
            backgroundColor: disabled
                ? MaterialStateProperty.all(neutralColor)
                : buttonColor != null
                    ? MaterialStateProperty.all(buttonColor)
                    : MaterialStateProperty.all(Colors.black),
          ),
          onPressed: disabled || loading
              ? null
              : () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  onPressed();
                },
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : child ??
                  Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: titleStyle ?? regularWhiteLabel,
                  ),
        );
      case ButtonType.elevateSecondary:
        return ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(
                  color: neutralColor,
                ),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              Size(
                width ?? 100,
                50,
              ),
            ),
            backgroundColor: disabled
                ? MaterialStateProperty.all(neutralColor)
                : MaterialStateProperty.all(Colors.white),
          ),
          onPressed: disabled || loading
              ? null
              : () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  onPressed();
                },
          child: loading
              ? const CircularProgressIndicator(
                  color: secondaryColor,
                )
              : icon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Center(
                            child: Text(
                              title ?? '',
                              style:
                                  titleStyle ?? regularLabel,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: icon,
                        )
                      ],
                    )
                  : child ??
                      Text(
                        title ?? '',
                        style: titleStyle ?? regularLabel,
                      ),
        );
      case ButtonType.text:
        return TextButton(
          onPressed: disabled
              ? () {}
              : () {
                  onPressed();
                },
          style: ButtonStyle(
            minimumSize: minimumSize != null ? MaterialStateProperty.all(minimumSize) : null,
          ),
          child: child ??
              Text(
                title ?? '',
                style: disabled
                    ? Theme.of(context).textTheme.headline6?.copyWith(fontSize: 17)
                    : titleStyle ?? Theme.of(context).textTheme.headline2?.copyWith(fontSize: 17),
              ),
        );
      case ButtonType.icon:
        Widget iconButton = IconButton(
          icon: icon!,
          disabledColor: neutralColor,
          iconSize: iconSize != null && iconSize! > 0 ? iconSize! : 24.0,
          color: iconColor ?? iconColor,
          onPressed: disabled
              ? null
              : () {
                  onPressed();
                },
        );
        return withBorder
            ? _BuildBorder(
                borderThikness: 2,
                borderColor: neutralColor,
                child: iconButton,
              )
            : iconButton;
      case ButtonType.iconWithBackground:
        return ElevatedButton(
          onPressed: disabled
              ? () {}
              : () {
                  onPressed();
                },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            elevation: 0,
            padding: EdgeInsets.all(padding ?? 10),
            primary: disabled ? neutralColor : buttonColor ?? Theme.of(context).primaryColor,
          ),
          child: child ?? icon,
        );
      default:
        return Container();
    }
  }
}

class _BuildBorder extends StatelessWidget {
  final Widget child;
  final double? borderThikness;
  final Color? borderColor;

  const _BuildBorder({
    Key? key,
    required this.child,
    this.borderThikness = 2,
    this.borderColor = neutralColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor!, width: borderThikness!),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: child,
    );
  }
}
