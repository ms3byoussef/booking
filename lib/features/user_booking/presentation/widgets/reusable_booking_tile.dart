import 'package:booking_app_algoriza/core/models/UserBooking/booking_data.dart';
import 'package:flutter/material.dart';

class ReusableBookingTile extends StatelessWidget {
  final BookingData item;

  const ReusableBookingTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(
        item.hotel!.name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
