import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final String? title;
  final String? text;
  const AccountWidget({
    this.title,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          text!,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
