// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final Color color, textColor;
  final double borderWidth,
      radius,
      verticalPadding,
      horizontalPadding,
      fontSize,
      iconSize;
  final IconData iconData;
  final String text;
  final VoidCallback? onPressed;

  const CustomSocialButton({
    super.key,
    this.color = Colors.blue,
    this.textColor = Colors.black,
    this.borderWidth = 2,
    this.radius = 15,
    this.verticalPadding = 15,
    this.horizontalPadding = 15,
    this.fontSize = 20,
    this.iconSize = 30,
    this.onPressed,
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            BorderSide(width: borderWidth, color: color)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius))),
        ),
        foregroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(iconData),
          Text(text),
          const SizedBox(),
        ],
      ),
    );
  }
}
