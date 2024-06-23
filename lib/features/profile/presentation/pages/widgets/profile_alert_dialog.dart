import 'package:flutter/material.dart';

import '../../../../../core/widgets/default_btn.dart';
import 'account_widget.dart';

class ProfileAlertDialog extends StatelessWidget {
  const ProfileAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const SizedBox(
        height: 130,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AccountWidget(
                title: "Email",
                text: "admin@admin.com  ",
              ),
              Divider(
                color: Colors.black38,
              ),
              AccountWidget(
                title: "phone",
                text: "+965 6906 6111",
              ),
            ]),
      ),
      title: Text(
        "Call Us",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
          child: DefaultButton(
            height: 45,
            text: "Ok",
            press: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
