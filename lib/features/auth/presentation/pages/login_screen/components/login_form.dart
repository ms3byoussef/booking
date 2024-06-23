// ignore_for_file: library_private_types_in_public_api, avoid_print, duplicate_ignore

import 'package:booking_app_algoriza/core/blocs/profile/login_cubit.dart';
import 'package:booking_app_algoriza/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../../../core/utils/AppTextStyle.dart';
import '../../../../../../../../core/utils/validator.dart';
import '../../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../../../../../core/widgets/custom_text_button.dart';
import '../../../../../../../../core/widgets/password_form_field.dart';

import '../../../../../../core/blocs/login/login_state.dart';
import '../../../../../../core/component/constants.dart';
import '../../sign_up_screen/sign_up_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildEmailTF() {
    return CustomFormField(
      label: appTranslation(context).email,
      controller: email,
      hintText: appTranslation(context).enter_email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator.validateEmail(value!),
      prefixIcon: const Icon(
        Icons.email,
      ),
    );
  }

  Widget _buildPasswordTF() {
    return PasswordFormField(
      label: appTranslation(context).pass,
      controller: password,
      hintText: appTranslation(context).enter_password,
      validator: (value) => Validator.validatePassword(value!),
      prefixIcon: const Icon(
        Icons.lock,
        color: Colors.white,
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/reset_password"),
        child: Text(
          appTranslation(context).forget_pass,
          style: AppTextStyle.smallStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return SizedBox(
      height: 30.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            appTranslation(context).remember_me,
            style: AppTextStyle.smallStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.toString());
        }
        if (state is UserLoginLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CustomTextButton(
            onPressed: () async {
              if (email.text.isEmpty) {
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    message: appTranslation(context).email_empty,
                  ),
                );
                return;
              }
              if (password.text.isEmpty) {
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    message: appTranslation(context).password_empty,
                  ),
                );
                return;
              }

              if (password.text.length < 5) {
                showTopSnackBar(
                  context,
                  const CustomSnackBar.error(
                    message: "Password is min than six",
                  ),
                );
                return;
              }

              if (_formKey.currentState!.validate()) {
                LoginCubit.get(context).userLogin(
                  email: email.text,
                  password: password.text,
                );
              } else {
                print("Not Valid");
              }
            },
            text: appTranslation(context).login,
          ),
        );
      },
    );
  }

  Widget _buildSignUpWithText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Text(
            "__OR__",
            style: AppTextStyle.smallStyle.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appTranslation(context).not_have_account,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen()));
                },
                child: Text(
                  appTranslation(context).register,
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.toString());
        }
        if (state is UserLoginSuccessState) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreen()));
        }
      },
      builder: (context, state) {
        return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  _buildEmailTF(),
                  _buildPasswordTF(),
                  _buildForgotPasswordBtn(),
                  _buildRememberMeCheckbox(),
                  _buildLoginBtn(),
                  _buildSignUpWithText(),
                ],
              ),
            ));
      },
    );
  }
}
