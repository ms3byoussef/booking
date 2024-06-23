// // ignore_for_file: unused_local_variable

// import 'package:booking_app_algoriza/core/blocs/profile/profile_cubit.dart';
// import 'package:booking_app_algoriza/core/models/user_model.dart';
// import 'package:booking_app_algoriza/features/edit_profile/presentation/pages/edit_profile/edit_profile_screen.dart';
// import 'package:booking_app_algoriza/features/onboarding_screens/presentation/pages/splash_screen/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../../config/themes/theme_cubit.dart';

// import '../../../../../../core/blocs/profile/profile_state.dart';
// import '../../../../../../core/utils/shared_preferences.dart';
// import '../../../../../../core/widgets/default_btn.dart';
// import '../../widgets/profile_alert_dialog.dart';
// import '../../widgets/setting_item.dart';
// import 'profile_menu_item.dart';

// class Body extends StatefulWidget {
//   const Body({super.key});

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   UserModel? user2;
//   @override
//   Widget build(BuildContext context) {
//     var user = ProfileCubit.get(context).user;

//     return SingleChildScrollView(
//       child: BlocConsumer<ProfileCubit, ProfileState>(
//         listener: (context, state) {
//           if (state is ErrorState) {
//             debugPrint(state.exception.toString());
//           }
//           if (state is ProfileInitial) {
//             ProfileCubit.get(context).userProfile();
//           }
//           // print(user);
//         },
//         builder: (context, state) {
//           print(user2!.name);
//           print("##########################");
//           return Column(
//             children: <Widget>[
//               // Info(
//               //   haveImage: true,
//               //   image: cubit.user!.image,
//               //   name: cubit.user!.name,
//               //   email: cubit.user!.email,
//               // ),
//               // Text(user!.name),
//               const SizedBox(height: 20), //20
//               ProfileMenuItem(
//                 icon: const Icon(Icons.edit_attributes),
//                 title: "Edit Profile",
//                 press: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (_) => const EditProfileScreen()));
//                 },
//               ),

//               ProfileMenuItem(
//                 icon: const Icon(Icons.add_ic_call_rounded),
//                 title: "Change Language",
//                 press: () {},
//               ),
//               ProfileMenuItem(
//                 icon: const Icon(Icons.add_ic_call_rounded),
//                 title: "Call Us",
//                 press: () {
//                   showDialog(
//                       context: context,
//                       builder: (_) => const ProfileAlertDialog());
//                 },
//               ),
//               ProfileMenuItem(
//                 icon: const Icon(Icons.settings),
//                 title: "Setting",
//                 press: () {
//                   setState(() {
//                     isSetting = !isSetting;
//                   });
//                 },
//               ),
//               Visibility(
//                 visible: isSetting,
//                 child: Column(
//                   children: [
//                     SettingItem(
//                       value: isDark,
//                       icon: const Icon(Icons.dark_mode),
//                       title: " Dark Mode",
//                       onChanged: (value) {
//                         setState(() {
//                           isDark = value;
//                         });
//                         ThemeCubit.get(context).toggleTheme(isDark);
//                       },
//                     ),
//                     SettingItem(
//                       value: true,
//                       icon: const Icon(Icons.language),
//                       title: "Change Language",
//                       onChanged: (value) {},
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//                 child: DefaultButton(
//                   press: () async {
//                     CacheHelper.removeData(key: "token");

//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (_) => const SplashScreen(),
//                       ),
//                     );
//                   },
//                   text: "Logout",
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
