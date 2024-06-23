import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/model/Explore/hotel_data.dart';
import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/core/utils/hex_color.dart';
import 'package:booking_app_algoriza/core/utils/media_query_values.dart';
import 'package:booking_app_algoriza/core/widgets/custom_button.dart';
import 'package:booking_app_algoriza/core/widgets/custom_text.dart';
import 'package:booking_app_algoriza/features/booking_successfully/presentation/pages/booking_successfully.dart';
import 'package:booking_app_algoriza/features/home/presentation/pages/widgets/appbar/main_flex_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final HotelData item;

  const DetailsScreen({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
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
        if (state is CreateBooking) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const BookingSuccessfully()));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 300,
                        child: FlexMainWidget(isShrink: false, item: item),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          elevation: 0,
                          mini: true,
                          backgroundColor: HexColor('#EFEEEE'),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: item.name.toUpperCase(),
                        style: AppTextStyle.normalTitle,
                        maxLines: 3,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                text: item.address,
                                style: AppTextStyle.normalSubtitle,
                                maxLines: 5,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: () {},
                                child: CustomText(
                                    text: appTranslation(context).show_in_map,
                                    style: AppTextStyle.showInMapsStyle),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      CustomText(
                        maxLines: 100,
                        text: item.description,
                        style: AppTextStyle.descriptionStyle,
                      ),
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                              text: appTranslation(context).price,
                              style: AppTextStyle.variantStyle),
                          CustomText(
                              text: 'E£${item.price}',
                              style: AppTextStyle.normalSubtitle),
                        ],
                      ),
                      Column(
                        children: [
                          CustomText(
                              text: appTranslation(context).rates,
                              style: AppTextStyle.variantStyle),
                          CustomText(
                              text: '${item.rate} ★',
                              style: AppTextStyle.normalSubtitle),
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    elevation: 5,
                    backgroundColor: HexColor('#EFEEEE'),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black,
                    ),
                  ),
                  CustomButton(
                    text: appTranslation(context).booknow,
                    onPressed: () {
                      cubit.createBooking(hotelId: item.id);
                    },
                    width: context.width * 0.65,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
