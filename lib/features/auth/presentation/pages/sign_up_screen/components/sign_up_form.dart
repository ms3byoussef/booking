// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:booking_app_algoriza/core/blocs/register/register_cubit.dart';
import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../../../../core/utils/validator.dart';
import '../../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../../../../../core/widgets/custom_text_button.dart';
import '../../../../../../../../core/widgets/password_form_field.dart';
import '../../../../../../core/blocs/register/register_state.dart';
import '../../../../../../core/component/constants.dart';
import '../../../../../home/presentation/pages/home_screen.dart';
import '../../login_screen/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget _buildNameTF() {
    return CustomFormField(
      label: appTranslation(context).username,
      controller: name,
      hintText: appTranslation(context).enter_name,
      keyboardType: TextInputType.name,
      validator: (value) => Validator.validateEmpty(value!),
      prefixIcon: const Icon(
        Icons.person,
        color: Colors.white,
      ),
    );
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
        color: Colors.white,
      ),
    );
  }

  // Widget _buildPhoneTF() {
  //   return CustomFormField(
  //     label: "Phone",
  //     controller: phone,
  //     hintText: "Enter your phone",
  //     keyboardType: TextInputType.phone,
  //     validator: (value) => Validator.validateEmpty(value!),
  //     prefixIcon: const Icon(
  //       Icons.phone,
  //       color: Colors.white,
  //     ),
  //   );
  // }

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

  Widget _buildConfirmPasswordTF() {
    return PasswordFormField(
      label: appTranslation(context).confirm_pass,
      controller: confirmPassword,
      hintText: appTranslation(context).enter_confirm_pass,
      validator: (value) {
        if (value!.isEmpty) return "Empty";
        if (value != password.text) {
          return "Not match";
        }
        return null;
      },
      prefixIcon: const Icon(
        Icons.lock,
        color: Colors.white,
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.toString());
        }
        if (state is UserRegisterLoadingState) {
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
        if (state is UserRegisterSuccessState) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreen()));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
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
                if (confirmPassword.text.isEmpty) {
                  showTopSnackBar(
                    context,
                    const CustomSnackBar.error(
                      message: "ConfirmPassword is empty",
                    ),
                  );
                  return;
                }
                if (confirmPassword.text != password.text) {
                  showTopSnackBar(
                    context,
                    const CustomSnackBar.error(
                      message: "confirmPassword and password don't match",
                    ),
                  );
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  RegisterCubit.get(context).userRegister(
                      name: name.text,
                      email: email.text,
                      password: password.text,
                      confirmPassword: confirmPassword.text);
                } else {
                  print("Not Valid");
                }
              },
              text: appTranslation(context).register),
        );
      },
    );
  }

  Widget _buildSignInWithText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Text(
            appTranslation(context).or,
            style: AppTextStyle.smallStyle.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appTranslation(context).have_account,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
                child: Text(
                  appTranslation(context).login,
                  style: AppTextStyle.medium.copyWith(fontSize: 21),
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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is ErrorState) {
          debugPrint(state.exception.toString());
        }
      },
      builder: (context, state) {
        return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildNameTF(),
                  _buildEmailTF(),
                  _buildPasswordTF(),
                  _buildConfirmPasswordTF(),
                  _buildSignUpBtn(),
                  _buildSignInWithText(),
                ],
              ),
            ));
      },
    );
  }
}
