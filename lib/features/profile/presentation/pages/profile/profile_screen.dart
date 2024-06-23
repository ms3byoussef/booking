// ignore_for_file: unnecessary_type_check

import 'package:booking_app_algoriza/core/blocs/profile/profile_cubit.dart';
import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/features/user_booking/presentation/pages/user_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/themes/theme_cubit.dart';
import '../../../../../core/blocs/profile/profile_state.dart';
import '../../../../../core/utils/shared_preferences.dart';
import '../../../../../core/widgets/default_btn.dart';
import '../../../../edit_profile/presentation/pages/edit_profile/edit_profile_screen.dart';
import '../../../../onboarding_screens/presentation/pages/splash_screen/splash_screen.dart';
import '../widgets/profile_alert_dialog.dart';
import '../widgets/setting_item.dart';
import 'components/info.dart';
import 'components/profile_menu_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSetting = false;

  @override
  void initState() {
    ProfileCubit.get(context).userProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ProfileCubit.get(context).user;
    var cubit = AppCubit.get(context);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {
            if (state is AppLoading) {
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
            if (state is GetUpComingBooking) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const UserBooking()));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Info(
                    image: user!.image,
                    name: user.name,
                    email: user.email,
                  ),
                  const SizedBox(height: 20), //20
                  ProfileMenuItem(
                    icon: const Icon(Icons.edit_attributes),
                    title: appTranslation(context).edit_profile,
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const EditProfileScreen()));
                    },
                  ),

                  ProfileMenuItem(
                    icon: const Icon(Icons.book_online),
                    title: appTranslation(context).myBooking,
                    press: () {
                      cubit.getUpcomingBooking();
                      cubit.getCancelledBooking();
                      cubit.getCompletedBooking();
                    },
                  ),
                  ProfileMenuItem(
                    icon: const Icon(Icons.add_ic_call_rounded),
                    title: appTranslation(context).call_us,
                    press: () {
                      showDialog(
                          context: context,
                          builder: (_) => const ProfileAlertDialog());
                    },
                  ),
                  ProfileMenuItem(
                    icon: const Icon(Icons.settings),
                    title: appTranslation(context).setting,
                    press: () {
                      setState(() {
                        isSetting = !isSetting;
                      });
                    },
                  ),
                  Visibility(
                    visible: isSetting,
                    child: Column(
                      children: [
                        SettingItem(
                          value: isDarkTheme,
                          icon: const Icon(Icons.dark_mode),
                          title: appTranslation(context).dark_mode,
                          onChanged: (value) {
                            setState(() {
                              ThemeCubit.get(context).toggleTheme();
                            });
                          },
                        ),
                        BlocBuilder<AppCubit, AppState>(
                          builder: (context, state) {
                            return SettingItem(
                              value: isRtl,
                              icon: const Icon(Icons.language),
                              title: appTranslation(context).change_lang,
                              onChanged: (value) {
                                setState(() {
                                  AppCubit.get(context).changeLanguage();
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    child: DefaultButton(
                      press: () async {
                        CacheHelper.removeData(key: "token");

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SplashScreen(),
                          ),
                        );
                      },
                      text: appTranslation(context).logout,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
