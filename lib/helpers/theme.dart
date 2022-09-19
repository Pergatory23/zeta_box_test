import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zeta_box_test_app/constant/color_palette.dart';

enum MyThemeMode { light, dark }

ThemeData basicTheme() {
  final ThemeData lightBase = ThemeData.light();

  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      headline2: base.headline2?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: secondaryColor,
      ),
      headline3: base.headline3?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline4: base.headline5?.copyWith(
        backgroundColor: Colors.white.withAlpha(100),
        color: errorColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      headline6: base.headline6?.copyWith(
        color: neutralColor,
        fontSize: 13,
      ),
    );
  }

    return lightBase.copyWith(
      textTheme: _basicTextTheme(lightBase.textTheme),
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      errorColor: errorColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: _basicTextTheme(lightBase.textTheme).headline1?.copyWith(fontSize: 18),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
}
