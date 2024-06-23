import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookingSuccessfully extends StatelessWidget {
  const BookingSuccessfully({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.grey.withOpacity(.1),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: const Icon(
                    Icons.check,
                    color: Colors.blue,
                    size: 60,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      isRtl
                          ? appCubit.bookingModel!.status.title.ar
                          : appCubit.bookingModel!.status.title.en,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "${appTranslation(context).bookingId} ${appCubit.bookingModel!.status.bookingId}",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    CustomButton(
                      text: appTranslation(context).backToHome,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
