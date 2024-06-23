// import 'package:another_xlider/another_xlider.dart';
// import 'package:booking_app_algoriza/core/utils/AppTextStyle.dart';
// import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:clay_containers/clay_containers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/component/constants.dart';
// import '../../../../core/widgets/custom_hotel_card.dart';
// import '../../../../core/widgets/search_bar.dart';
// import '../../../../core/widgets/custom_hotel_card.dart';
//
// class FilterScreen extends StatefulWidget {
//   FilterScreen({super.key});
//
//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }
//
// class _FilterScreenState extends State<FilterScreen> {
//   var formKey = GlobalKey<FormState>();
//   var textController = TextEditingController();
//   var latitudeController = TextEditingController();
//   var longitudeController = TextEditingController();
//   var distanceController = TextEditingController();
//   var addressController = TextEditingController();
//   var min_priceController = TextEditingController();
//   var max_priceController = TextEditingController();
//   int age = 10;
//   @override
//   double start = 30.0;
//   double end = 50.0;
//
//   Widget build(BuildContext context) {
//     var cubit = AppCubit.get(context);
//     return BlocConsumer<AppCubit, AppState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Filter Search'),
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Search',
//                       prefixIcon: Icon(
//                         Icons.search,
//                       ),
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (String? value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your product name';
//                       }
//                       return null;
//                     },
//                     onFieldSubmitted: (String text) {
//                      // AppCubit.get(context).getSearch(text);
//                     },
//                   ),
//                   SizedBox(height: 10,),
//                   // FlutterSlider(
//                   //   values: [
//                   //     searchProvider.lowerValue,
//                   //     searchProvider.upperValue
//                   //   ],
//                   //   rangeSlider: true,
//                   //   max: maxValue,
//                   //   min: 0,
//                   //   rightHandler: sliderHandler,
//                   //   handler: sliderHandler,
//                   //   trackBar: FlutterSliderTrackBar(
//                   //     inactiveTrackBar: BoxDecoration(
//                   //       borderRadius: BorderRadius.circular(20),
//                   //       color: Colors.black12,
//                   //     ),
//                   //     activeTrackBar: BoxDecoration(
//                   //       borderRadius: BorderRadius.circular(4),
//                   //       color: Theme.of(context).primaryColor,
//                   //     ),
//                   //   ),
//                   //   handlerWidth: 20,
//                   //   handlerHeight: 20,
//                   //   tooltip: FlutterSliderTooltip(
//                   //     // alwaysShowTooltip: true,
//                   //     // disableAnimation: true,
//                   //     leftSuffix: price,
//                   //     rightSuffix: price,
//                   //     textStyle: TextStyle(
//                   //         fontSize: 17,
//                   //         color: ColorResources.getNewColorText(context)),
//                   //     boxStyle: FlutterSliderTooltipBox(),
//                   //   ),
//                   //   onDragging: (_, lowerValue, upperValue) => searchProvider
//                   //       .setLowerAndUpperValue(lowerValue, upperValue),
//                   // ),
//                   RangeSlider(
//                     values: RangeValues(start, end),
//                     labels: RangeLabels(start.toString(), end.toString()),
//                     onChanged: (value) {
//                       setState(() {
//                         start = value.start;
//                         end = value.end;
//                       });
//                     },
//                     min: 10.0,
//                     max: 80.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Min Price: " +
//                             start.toStringAsFixed(2),
//                         style: const TextStyle(
//                           fontSize: 20.0,
//                         ),
//                       ),
//                       SizedBox(width: 20,),
//                       Text(
//                         "Max Price: " +
//                             end.toStringAsFixed(2),
//                         style: const TextStyle(
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Slider(
//                   //   label: "Select Age",
//                   //   value: age.toDouble(),
//                   //   onChanged: (value) {
//                   //     setState(() {
//                   //       age = value.toInt();
//                   //     });
//                   //   },
//                   //   min: 5,
//                   //   max: 100,
//                   // ),
//                   // Text(
//                   //   "Your Age: " + age.toString(),
//                   //   style: const TextStyle(
//                   //     fontSize: 32.0,
//                   //   ),
//                   // ),
//                   SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       Container(
//                         width: 169,
//                         child: TextFormField(
//                           controller: longitudeController,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             labelText: 'longitude',
//                             prefixIcon: Icon(
//                               Icons.start,
//                             ),
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your product name';
//                             }
//                             return null;
//                           },
//                           onFieldSubmitted: (String text) {
//                             //  AppCubit.get(context).getSearch(text);
//                           },
//                         ),
//                       ),
//                       SizedBox(width: 10,),
//                       Container(
//                         width: 169,
//                         child: TextFormField(
//                           controller: latitudeController,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//
//                             labelText: 'latitude',
//                             prefixIcon: Icon(
//                               Icons.arrow_back,
//                             ),
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your product name';
//                             }
//                             return null;
//                           },
//                           onFieldSubmitted: (String text) {
//
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       Container(
//                         width: 169,
//                         child: TextFormField(
//                           controller: addressController,
//                           keyboardType: TextInputType.text,
//                           decoration: const InputDecoration(
//                             labelText: 'address',
//                             prefixIcon: Icon(
//                               Icons.location_on_outlined,
//                             ),
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your product name';
//                             }
//                             return null;
//                           },
//                           onFieldSubmitted: (String text) {
//                             //  AppCubit.get(context).getSearch(text);
//                           },
//                         ),
//                       ),
//                       SizedBox(width: 10,),
//                       Container(
//                         width: 169,
//                         child: TextFormField(
//                           controller: distanceController,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             labelText: 'distance',
//                             prefixIcon: Icon(
//                               Icons.social_distance,
//                             ),
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your product name';
//                             }
//                             return null;
//                           },
//                           onFieldSubmitted: (String text) {
//
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20,),
//                   Center(
//                     child: Container(
//                         width: 200,
//                         height: 40,
//                         child: ElevatedButton(onPressed: () {
//                           AppCubit.get(context).getSearchFilter(
//                              address:textController.text,
//                              count:textController.text,
//                              page:textController.text,
//                              facilities:textController.text,
//                              latitude:textController.text,
//                              longitude:textController.text,
//                              distance:textController.text,
//                               name:textController.text,
//
//                           )
//                         }, child: const Text('Search'))),
//                   ),
//                   if (state is SearchLoadingState)
//                     const LinearProgressIndicator(),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   if (state is SearchSuccessState)
//                     Expanded(
//                       child: ListView.separated(
//                         physics: BouncingScrollPhysics(),
//                         itemBuilder: (context, index) =>
//                             SearchCard(AppCubit
//                                 .get(context)
//                                 .searchModel!
//                                 .data!
//                                 .data![index], context),
//                         separatorBuilder: (context, index) =>
//                             SizedBox(
//                               height: 5,
//                             ),
//                         itemCount: cubit.searchModel!.data!.data!.length,
//                       ),
//                       // Text(
//                       //   "Hello ${"name"}",
//                       //   style: AppTextStyle.smallStyle.copyWith(
//                       //     color: Colors.grey,
//                       //   ),
//                       // ),
//                       // const SizedBox(height: 20),
//                       // Text(
//                       //   "Find your Hotel",
//                       //   style: AppTextStyle.medium.copyWith(
//                       //     color: Colors.black,
//                       //   ),
//                       // ),
//                       // const SizedBox(height: 20),
//                       // ClayContainer(
//                       //   borderRadius: 25,
//                       //   color: Colors.white,
//                       //   spread: 10,
//                       //   depth: 40,
//                       //   child: SearchBar(
//                       //     onTap: () {},
//                       //   ),
//                       // ),
//                       // const SizedBox(height: 20),
//                       // CarouselSlider(
//                       //   items: images
//                       //       .map(
//                       //         (e) => Center(
//                       //           child: Image.asset(
//                       //             e,
//                       //             fit: BoxFit.contain,
//                       //             width: 400,
//                       //           ),
//                       //         ),
//                       //       )
//                       //       .toList(),
//                       //   options: CarouselOptions(
//                       //     autoPlay: true,
//                       //     aspectRatio: 2.0,
//                       //   ),
//                       // ),
//                       // Padding(
//                       //   padding: const EdgeInsets.symmetric(vertical: 10),
//                       //   child: Text(
//                       //     "popular Hotel",
//                       //     style: AppTextStyle.medium.copyWith(
//                       //       color: Colors.black,
//                       //     ),
//                       //   ),
//                       // ),
//                       // SizedBox(
//                       //   height: MediaQuery.of(context).size.height * .6,
//                       //   child: ListView(
//                       //     children: const [
//                       //       CustomPackagesCard(),
//                       //       CustomPackagesCard(),
//                       //       CustomPackagesCard(),
//                       //       CustomPackagesCard(),
//                       //       CustomPackagesCard(),
//                       //     ],
//                       //   ),
//                       // )
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget SearchCard(model, context) =>
//       Container(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 5, bottom: 5),
//           child: SizedBox(
//             height: 124,
//             child: Card(
//               child: InkWell(
//                 splashColor: const Color(0XFFAAAEB4),
//                 onTap: () {
//                   debugPrint('Card tapped.');
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.asset('assets/images/home_packages_card.png'),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'The westin dhaka',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           const Text(
//                             'Kensington palace',
//                             style: TextStyle(fontSize: 12, color: Color(
//                                 0XFFC1C1C1)),
//                           ),
//                           const Text(
//                             '\$180/night',
//                             style: TextStyle(fontSize: 12, color: Color(
//                                 0XFF060B92)),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const [
//                               Icon(
//                                 Icons.directions_car,
//                                 color: Color(0XFF003AA8),
//                               ),
//                               Icon(
//                                 Icons.directions_car,
//                                 color: Color(0XFF003AA8),
//                               ),
//                               Icon(
//                                 Icons.directions_car,
//                                 color: Color(0XFF003AA8),
//                               ),
//                               Icon(
//                                 Icons.directions_car,
//                                 color: Color(0XFF003AA8),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     RotatedBox(
//                       quarterTurns: -1,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: Text(appTranslation(context).booknow),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
// }
