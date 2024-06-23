import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:booking_app_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/theme_cubit.dart';
import '../../../../../core/component/constants.dart';
import 'components/edit_profile_form.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0x1a009444),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 1.2,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 1.1,
                decoration: ThemeCubit.themeMode != ThemeMode.dark
                    ? const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff004c4c),
                            Color(0xFF006666),
                            Color(0xFF008080),
                            Color(0xff66b2b2),
                          ],
                          stops: [0.1, 0.4, 0.8, 0.9],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      )
                    : const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff161618),
                            Color(0xff818181),
                            Color(0xff161610),
                            Color(0xFF212124),
                          ],
                          stops: [0.1, 0.4, 0.8, 0.9],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                width: 60,
                                height: 40,
                                padding: const EdgeInsets.only(),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: const Icon(Icons.close)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 20, left: 20,
                          bottom:
                              4, // This can be the space you need between text and underline
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: AppColors.card,
                          width: 2, // This would be the width of the underline
                        ))),
                        child: Text(appTranslation(context).edit_profile,
                            style: AppTextStyle.medium),
                      ),
                      const SizedBox(height: 20),
                      const EditProfileForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
