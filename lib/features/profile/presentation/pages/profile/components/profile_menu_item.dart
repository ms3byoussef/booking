// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  ProfileMenuItem({Key? key, this.title, this.press, this.icon})
      : super(key: key);
  final String? title;
  Widget? icon = Container();
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              icon!,
              const SizedBox(width: 10),
              Text(
                title!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
              )
            ],
          ),
        ),
      ),
    );
  }
}
