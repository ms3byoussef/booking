// ignore_for_file: file_names

import 'package:booking_app_algoriza/core/utils/hex_color.dart';
import 'package:flutter/material.dart';

extension ThemeValues on BuildContext {
  TextStyle? get headLine1 => Theme.of(this).textTheme.headlineLarge;

  TextStyle? get headLine2 => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headLine3 => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get headLine4 => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get headLine5 => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get headLine6 => Theme.of(this).textTheme.bodySmall;

  TextStyle? get bodyText1 => Theme.of(this).textTheme.displayLarge;

  TextStyle? get bodyText2 => Theme.of(this).textTheme.displayMedium;
}

class AppTextStyle {
  static const TextStyle currentTemp =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 80);
  static const TextStyle largeStyle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 40);
  static const TextStyle medium = TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20);
  static const TextStyle smallStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  static const TextStyle normalTitle = TextStyle(
      color: Colors.black, fontWeight: FontWeight.normal, fontSize: 35);
  static const TextStyle normalSubtitle = TextStyle(
      color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20);
  static const TextStyle showInMapsStyle = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 16);
  static TextStyle descriptionStyle = TextStyle(
      color: HexColor('#8492A7'), fontWeight: FontWeight.normal, fontSize: 15);
  static TextStyle variantStyle = TextStyle(
      color: HexColor('#8492A7'), fontWeight: FontWeight.normal, fontSize: 20);
}
