// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors
import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/custom_text_button.dart';
import '../../../../../../../core/widgets/default_btn.dart';
import '../../../../auth/presentation/pages/login_screen/login_screen.dart';
import '../../../../auth/presentation/pages/sign_up_screen/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.textFormFieldBackground,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * .4,
                    width: size.width,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("WELCOME TO Booking Hotel ",
                        style: AppTextStyle.medium),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Never a better time\n than now to start.",
                    style: AppTextStyle.medium.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              // SizedBox(
              //   height: size.height * .1,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButton(
                      text: "Sign Up",
                      press: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignUpScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextButton(
                      text: "Login",
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
