// ignore_for_file: avoid_print

import 'package:booking_app_algoriza/config/translation/translation.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:flutter/material.dart';

bool? isInProgress;
String? token;

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

// ------------------- Translation
bool isRtl = false;
bool isDarkTheme = false;

TranslationModel appTranslation(context) =>
    AppCubit.get(context).translationModel;

String displayTranslatedText({
  required BuildContext context,
  required String ar,
  required String en,
}) =>
    isRtl ? ar : en;
