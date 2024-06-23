import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:booking_app_algoriza/features/home/presentation/pages/widgets/appbar/main_flex_widget.dart';
import 'package:booking_app_algoriza/features/search/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    Key? key,
    required this.isShrink,
  }) : super(key: key);

  final bool isShrink;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: SearchBar(
          onTap: () {
            AppCubit.get(context).getFacilities();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchScreen()));
          },
        ),
      ),
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height - 300,
      collapsedHeight: 230,
      flexibleSpace: _buildFlexibleSpaceBar(),
    );
  }

  final List<String> homeImages = [
    'assets/images/pyramids.jpg',
    'assets/images/mo3ez.jpg',
    'assets/images/m3bd.jpg',
  ];

  FlexibleSpaceBar _buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      centerTitle: true,
      stretchModes: const [StretchMode.zoomBackground],
      title: FlexMainWidget(isShrink: isShrink, homeImages: homeImages),
    );
  }
}
