// ignore_for_file: deprecated_member_use

import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeMode themeMode = ThemeMode.system;
  static ThemeCubit get(BuildContext context) => BlocProvider.of(context);

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeChanged());
  }
}
