import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/features/user_booking/presentation/widgets/reusable_booking_tile.dart';
import 'package:flutter/material.dart';

class CancelledScreen extends StatelessWidget {
  const CancelledScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return RefreshIndicator(
      onRefresh: () async {
        cubit.getCancelledBooking();
      },
      child: cubit.userCancelledBooking!.bookingData!.isEmpty
          ? Center(
              child: Image.asset(
                'assets/images/no_data.png',
                width: 200,
              ),
            )
          : ListView.builder(
              itemCount: cubit.userCancelledBooking!.bookingData!.length,
              itemBuilder: (context, index) => ReusableBookingTile(
                item: cubit.userCancelledBooking!.bookingData![index],
              ),
            ),
    );
  }
}