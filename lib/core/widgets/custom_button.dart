import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height, width, elevation;
  final VoidCallback? onPressed;
  final bool isUpperCase;
  final Color? color;
  final IconData? iconData;

  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.height = 55,
    this.width = double.infinity,
    required this.onPressed,
    this.isUpperCase = true,
    this.elevation = 0,
    this.iconData,
  });

  ///
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      clipBehavior: Clip.antiAlias,
      elevation: elevation,
      minWidth: width,
      color: color ?? AppColors.button,
      height: height,
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconData != null
                ? Icon(
                    iconData,
                  )
                : const SizedBox(),
            Text(
              text,
              style: TextStyle(color: AppColors.textButton),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
