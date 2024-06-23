import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/features/user_booking/presentation/widgets/reusable_booking_tile.dart';
import 'package:flutter/material.dart';

class UpComingScreen extends StatelessWidget {
  const UpComingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return RefreshIndicator(
      onRefresh: () async {
        cubit.getUpcomingBooking();
      },
      child: cubit.userUpcomingBooking!.total != 0
          ? ListView.builder(
              itemCount: cubit.userUpcomingBooking!.bookingData!.length,
              itemBuilder: (context, index) => ReusableBookingTile(
                item: cubit.userUpcomingBooking!.bookingData![index],
              ),
            )
          : Center(
              child: Image.asset(
                'assets/images/no_data.png',
                width: 200,
              ),
            ),
    );
  }
}
