// ignore_for_file: prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison

import 'dart:async';

import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/features/auth/presentation/pages/login_screen/login_screen.dart';
import 'package:booking_app_algoriza/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/shared_preferences.dart';
import '../intro_screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    bool isLogin = CacheHelper.getData(key: 'isLogin') ?? false;
    token = CacheHelper.getData(key: 'token');

    if (isLogin == true) {
      if (token != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  Color(0xFFF7F7F7),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff004c4c), Color(0xff008080)],
                    stops: [0, 1],
                    begin: Alignment(-1.00, 0.00),
                    end: Alignment(1.00, -0.00),
                    // angle: 90,
                    // scale: undefined,
                  ),
                  image: DecorationImage(
                    opacity: .8,
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                // margin: const EdgeInsets.all(20),
                // padding: const EdgeInsets.all(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
