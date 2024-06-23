import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/model/Explore/hotel_data.dart';
import 'package:booking_app_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_algoriza/features/details_hotel/presentation/pages/details_screen.dart';
import 'package:flutter/material.dart';

class CustomHotelCard extends StatelessWidget {
  final HotelData item;

  const CustomHotelCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: SizedBox(
        height: 124,
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
            child: Row(
              children: [
                item.hotelImages!.isNotEmpty
                    ? Image.network(
                        "${AppStrings.baseUrl}images/${item.hotelImages![0].image}",
                        fit: BoxFit.fitHeight,
                        width: 100,
                        height: 124,
                      )
                    : Image.asset(
                        'assets/images/home_packages_card.png',
                        fit: BoxFit.fitHeight,
                        width: 100,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Text(
                            item.name,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Text(
                            item.address,
                            style: const TextStyle(
                                fontSize: 12, color: Color(0XFFC1C1C1)),
                          ),
                        ),
                        Text(
                          'E£${item.price}/night',
                          style: const TextStyle(
                              fontSize: 12, color: Color(0XFF060B92)),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                RotatedBox(
                  quarterTurns: -1,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(appTranslation(context).booknow),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
