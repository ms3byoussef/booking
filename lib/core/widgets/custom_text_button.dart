// ignore_for_file: deprecated_member_use

import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:flutter/material.dart';

import '../../config/themes/app_theme.dart';

class CustomTextButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final double? height;
  const CustomTextButton({
    Key? key,
    this.text,
    this.onPressed,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              AppTheme().lightTheme.primaryColor),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(
                  width: 1, color: AppTheme().lightTheme.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            text!,
            style: AppTextStyle.medium.copyWith(
                color: AppTheme().lightTheme.primaryColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
