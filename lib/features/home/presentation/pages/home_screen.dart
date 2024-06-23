import 'package:booking_app_algoriza/core/blocs/profile/profile_cubit.dart';
import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/features/home/presentation/pages/widgets/home_page/home_content.dart';
import 'package:booking_app_algoriza/features/profile/presentation/pages/profile/profile_screen.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../hotels_map/hotels_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  late List<Widget> screens;

  @override
  void initState() {
    ProfileCubit.get(context).userProfile();

    super.initState();
    screens = const [HomeContent(), HotelsMap(), ProfileScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            body: screens[_currentIndex],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
              child: ClayContainer(
                borderRadius: 10,
                spread: 10,
                depth: 40,
                color: Theme.of(context).primaryColor,
                curveType: CurveType.convex,
                child: SalomonBottomBar(
                  currentIndex: _currentIndex,
                  onTap: (i) => setState(() => _currentIndex = i),
                  items: [
                    /// Home
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.home),
                      title: Text(appTranslation(context).home),
                      selectedColor: const Color(0XFF003AA8),
                    ),

                    /// Search
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.explore),
                      title: Text(appTranslation(context).explore),
                      selectedColor: const Color(0XFF003AA8),
                    ),

                    /// Profile
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.person),
                      title: Text(appTranslation(context).profile),
                      selectedColor: const Color(0XFF003AA8),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
