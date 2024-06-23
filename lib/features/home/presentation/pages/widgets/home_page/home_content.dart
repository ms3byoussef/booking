import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/core/widgets/custom_hotel_card.dart';
import 'package:booking_app_algoriza/core/widgets/custom_top_rated_card.dart';
import 'package:booking_app_algoriza/features/home/presentation/pages/widgets/appbar/custom_appbar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late ScrollController _scrollController;

  bool _appBarCollapsed = false;

  bool isShrink() {
    return _scrollController.hasClients && _scrollController.offset > (230 - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (isShrink() && !_appBarCollapsed) {
          setState(() => _appBarCollapsed = true);
        } else if (!isShrink() && _appBarCollapsed) {
          setState(() => _appBarCollapsed = false);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    List<Widget> widgetsList = [
      BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ConditionalBuilder(
            condition: cubit.explore != null,
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    appTranslation(context).topRatedHotels,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CustomTopRatedCard(item: cubit.sortedHotelData![index]),
                      itemCount: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    appTranslation(context).hotels,
                    style: const TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: cubit.hotelData!.length * 140,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => CustomHotelCard(item: cubit.hotelData![index]),
                      itemCount: cubit.hotelData!.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ];

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomAppBar(
              isShrink: _appBarCollapsed,
            ),
            SliverList(
              delegate: SliverChildListDelegate(widgetsList),
            ),
          ],
        );
      },
    );
  }
}
