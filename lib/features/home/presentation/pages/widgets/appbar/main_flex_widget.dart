import 'package:booking_app_algoriza/core/model/Explore/hotel_data.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/core/utils/app_strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FlexMainWidget extends StatefulWidget {
  const FlexMainWidget({Key? key, this.isShrink, this.item, this.homeImages})
      : super(key: key);

  final bool? isShrink;
  final HotelData? item;
  final List<String>? homeImages;

  @override
  State<FlexMainWidget> createState() => _FlexMainWidgetState();
}

class _FlexMainWidgetState extends State<FlexMainWidget> {
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    List<Image> images = widget.item != null
        ? List.generate(
            widget.item!.hotelImages!.length,
            (index) => Image.network(
              "${AppStrings.baseUrl}images/${widget.item!.hotelImages![index].image}",
              fit: BoxFit.cover,
            ),
          )
        : List.generate(
            widget.homeImages!.length,
            (index) => Image.asset(
              widget.homeImages![index],
              fit: BoxFit.cover,
            ),
          );

    CarouselController buttonCarouselController = CarouselController();
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Center(
          child: Stack(
            children: [
              CarouselSlider(
                items: images,
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: widget.isShrink! ? false : true,
                    height: MediaQuery.of(context).size.height - 280,
                    viewportFraction: 1,
                    disableCenter: true,
                    initialPage: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentImage = index;
                      });
                    }),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentImage,
                    count: widget.item != null
                        ? widget.item!.hotelImages!.length
                        : widget.homeImages!.length,
                    effect: const WormEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.indigo),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
