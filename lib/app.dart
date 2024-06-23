import 'package:booking_app_algoriza/core/blocs/profile/login_cubit.dart';
import 'package:booking_app_algoriza/core/blocs/register/register_cubit.dart';
import 'package:booking_app_algoriza/core/blocs/update_profile/update_profile_cubit.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/features/onboarding_screens/presentation/pages/splash_screen/splash_screen.dart';
import 'package:booking_app_algoriza/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/themes/app_theme.dart';
import 'config/themes/theme_cubit.dart';
import 'core/blocs/profile/profile_cubit.dart';
import 'core/di/injection.dart';
import 'core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  final String translation;
  final bool isRtl;
  const MyApp({
    Key? key,
    required this.translation,
    this.isRtl = false,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => sl<RegisterCubit>(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => sl<ProfileCubit>()..userProfile(),
        ),
        BlocProvider<UpdateProfileCubit>(
          create: (context) => sl<UpdateProfileCubit>(),
        ),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<AppCubit>(
            create: (context) => sl<AppCubit>()
              ..setTranslation(translation: translation)
              ..getHotels()),
        //(context) => ThemeCubit()
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          debugPrint(ThemeCubit.themeMode.toString());
          return MaterialApp(
              key: alice.getNavigatorKey(),
              title: AppStrings.appName,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeCubit.themeMode,
              theme: AppTheme().lightTheme,
              darkTheme: AppTheme().darkTheme,
              home: const SplashScreen());
        },
      ),
    );
  }
}
