// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

class SettingItem extends StatelessWidget {
  SettingItem(
      {Key? key, this.title, this.icon, required this.value, this.onChanged})
      : super(key: key);
  final String? title;
  Widget? icon = const SizedBox();
  final bool value;
  void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            icon!,
            const SizedBox(width: 7),
            Text(
              title!,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            CupertinoSwitch(
              activeColor: AppColors.primary,
              value: value,
              onChanged: onChanged,
            )
          ],
        ),
      ),
    );
  }
}
