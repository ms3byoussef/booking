// ignore_for_file: unused_local_variable, avoid_print

import 'dart:io';

import 'package:alice/alice.dart';
import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/di/injection.dart';
import 'core/my_bloc_observer.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/shared_preferences.dart';

Alice alice = Alice(
  showNotification: true,
);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  final Directory appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox(AppStrings.hiveBox);
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = MyHttpOverrides();

  Widget widget;
  init();
  isRtl = CacheHelper.getData(key: 'isRtl') ?? false;
  token = CacheHelper.getData(key: 'token');
  print("_____________TOKEN___________$token");

  String translation = await rootBundle
      .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');

  runApp(MyApp(
    isRtl: isRtl,
    translation: translation,
  ));
}
