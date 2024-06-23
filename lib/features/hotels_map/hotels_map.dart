// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/model/Explore/hotel_data.dart';
import 'package:booking_app_algoriza/core/utils/app_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../core/utils/app_strings.dart';
import '../details_hotel/presentation/pages/details_screen.dart';

class HotelsMap extends StatefulWidget {
  const HotelsMap({
    Key? key,
  }) : super(key: key);

  @override
  State createState() {
    return HotelsMapState();
  }
}

class HotelsMapState extends State<HotelsMap> {
  final GlobalKey scaffoldKey = GlobalKey();

  final Completer _controller = Completer();
  Coordinates? lastCoordinates;
  bool isRunning = false;
  int currentIndex = 0;
  GoogleMapController? mapController;

  CarouselController controller = CarouselController();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30, 31),
    zoom: 10.0,
  );
  List? newNursery;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    lastCoordinates = Coordinates(latitude: 31, longitude: 30);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (AppCubit.get(context).hotelData!.isNotEmpty && currentIndex == 0) {
      _gotoLocation(
        double.parse(AppCubit.get(context).hotelData![0].latitude),
        double.parse(AppCubit.get(context).hotelData![0].longitude),
      );
    }
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      appTranslation(context).map,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    _buildGoogleMap(context),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 250.0,
                          width: MediaQuery.of(context).size.width,
                          child: CarouselSlider(
                            carouselController: controller,
                            items: AppCubit.get(context).hotelData!.map((e) {
                              AppCubit.get(context).sortedHotelData;

                              HotelData hotel = AppCubit.get(context)
                                  .hotelData![currentIndex];

                              return Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Theme.of(context).cardColor),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffffffff),
                                                  width: 5),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color(0x29000000),
                                                    offset: Offset(0, 0),
                                                    blurRadius: 11,
                                                    spreadRadius: 0)
                                              ],
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${AppStrings.baseUrl}images/${hotel.hotelImages![0].image}"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                child: Text(
                                                  "${hotel.name} ",
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: 120,
                                                height: 25,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            child:
                                                Icon(Icons.location_on_rounded),
                                          ),
                                          SizedBox(
                                            width: 9,
                                          ),
                                          Expanded(
                                            child: Text(hotel.address,
                                                maxLines: 2,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (_) => DetailsScreen(
                                                        item: hotel,
                                                      )));
                                        },
                                        child: Container(
                                          // width: 139,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Color(0x2b5a5a5a),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 11,
                                                  spreadRadius: 0)
                                            ],
                                            color: Theme.of(context)
                                                .highlightColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                                appTranslation(context).details,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 250.0,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              autoPlay: false,
                              aspectRatio: 15 / 8,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: false,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 0.8,
                              onPageChanged: (c, reason) {
                                setState(() {
                                  currentIndex = c;
                                });
                                _gotoLocation(
                                    double.parse(AppCubit.get(context)
                                        .hotelData![currentIndex]
                                        .latitude),
                                    double.parse(AppCubit.get(context)
                                        .hotelData![currentIndex]
                                        .longitude));
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  getCurrentLocation() async {
    print("get current");
    var location = Location();
    try {
      print("get Location");
      location.getLocation().then((location) async {
        isRunning = true;
        print("entered");
        lastCoordinates = Coordinates(
            latitude: location.latitude, longitude: location.longitude);

        // this.widget.viewModel.getNearestBusiness(
        //     lastCoordinates.latitude, lastCoordinates.longitude);
        setState(() {});
      }).catchError(((onError) {
        print("onError     $onError");
      }));
    } catch (e) {
      print("error===> $e");
      if (e == 'PERMISSION_DENIED') {}
    }
  }

  Widget _buildGoogleMap(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onCameraMove: (position) {},
      onMapCreated: (GoogleMapController controller) {
        if (!_controller.isCompleted) _controller.complete(controller);
        mapController = controller;
        setState(() {});
      },
      markers: {}..addAll(AppCubit.get(context).hotelData!.map((hotel) =>
          Marker(
              markerId: MarkerId(hotel.id.toString()),
              position: LatLng(
                  double.parse(hotel.latitude), double.parse(hotel.latitude)),
              infoWindow: InfoWindow(title: hotel.name),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueViolet,
              ),
              onTap: () {
                controller.animateToPage(
                    AppCubit.get(context).hotelData!.indexOf(hotel));
              }))),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 18,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}
