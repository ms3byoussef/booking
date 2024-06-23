// ignore_for_file: library_private_types_in_public_api

import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../config/themes/theme_cubit.dart';
import '../../../../../core/component/constants.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: ThemeCubit.themeMode != ThemeMode.dark
                  ? const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff004c4c),
                          Color(0xFF006666),
                          Color(0xFF008080),
                          Color(0xff66b2b2),
                        ],
                        stops: [0.1, 0.4, 0.8, 0.9],
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    )
                  : const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff161618),
                          Color(0xff818181),
                          Color(0xff161617),
                          Color(0xFF212124),
                        ],
                        stops: [0.1, 0.4, 0.8, 0.9],
                      ),
                    ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      // child: LanguageItem(options, onOptionsChanged),
                    ),
                    Text(appTranslation(context).register,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.largeStyle.copyWith(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 30.0),
                    const SignUpForm()
                  ],
                ),
              ),
            )));
  }
}
