import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/features/user_booking/presentation/widgets/cancelled_screen.dart';
import 'package:booking_app_algoriza/features/user_booking/presentation/widgets/completed_screen.dart';
import 'package:booking_app_algoriza/features/user_booking/presentation/widgets/reusable_tab_selector.dart';
import 'package:booking_app_algoriza/features/user_booking/presentation/widgets/upcoming_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBooking extends StatelessWidget {
  const UserBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Directionality(
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  appTranslation(context).myBooking,
                ),
                shape: const Border(
                  bottom: BorderSide(width: 1),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1),
                      ),
                    ),
                    child: TabBar(
                      isScrollable: true,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 3,
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      tabs: [
                        ReusableTabSelector(
                            text: appTranslation(context).upcoming),
                        ReusableTabSelector(
                            text: appTranslation(context).completed),
                        ReusableTabSelector(
                            text: appTranslation(context).cancelled),
                      ],
                    ),
                  ),
                ),
              ),
              body: const Padding(
                padding: EdgeInsets.only(top: 15),
                child: TabBarView(
                  children: [
                    UpComingScreen(),
                    CompletedScreen(),
                    CancelledScreen(),
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
