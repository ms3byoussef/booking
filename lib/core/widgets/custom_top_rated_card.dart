import 'package:booking_app_algoriza/core/model/Explore/hotel_data.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_algoriza/features/details_hotel/presentation/pages/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTopRatedCard extends StatelessWidget {
  final HotelData item;

  const CustomTopRatedCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: SizedBox(
            width: 180,
            child: Card(
              child: InkWell(
                splashColor: const Color(0XFFAAAEB4),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(item: item)),
                  );
                },
                child: Column(
                  children: [
                    item.hotelImages!.isNotEmpty
                        ? Image.network(
                            "${AppStrings.baseUrl}images/${item.hotelImages![0].image}",
                            height: 100,
                            width: 180,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/home_popular_card1.png',
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        height: 72,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                            ),
                            Text(
                              item.address,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0XFFC1C1C1),
                              ),
                              maxLines: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'E£${item.price}/night',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0XFF060B92),
                                  ),
                                ),
                                Text(
                                  '${item.rate} ★',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0XFF0D44AC),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
