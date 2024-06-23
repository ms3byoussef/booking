import 'dart:convert';

import 'package:booking_app_algoriza/config/translation/translation.dart';
import 'package:booking_app_algoriza/core/component/constants.dart';
import 'package:booking_app_algoriza/core/errors/exceptions.dart';
import 'package:booking_app_algoriza/core/model/Explore/explore.dart';
import 'package:booking_app_algoriza/core/model/Explore/hotel_data.dart';
import 'package:booking_app_algoriza/core/models/Booking/booking_response_model.dart';
import 'package:booking_app_algoriza/core/models/UserBooking/MainData.dart';
import 'package:booking_app_algoriza/core/models/facilities_model.dart';
import 'package:booking_app_algoriza/core/network/dio_helper.dart';
import 'package:booking_app_algoriza/core/network/repository.dart';
import 'package:booking_app_algoriza/core/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final Repository repository;

  AppCubit({required this.repository}) : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_rounded;
  bool isPasswordShow = true;
  int currentIndex = 0;

  int? maxLines;
  bool seeMore = true;

  void changeLanguage() async {
    isRtl = !isRtl;

    CacheHelper.saveData(key: 'isRtl', value: isRtl);
    String translation = await rootBundle
        .loadString('assets/translations/${isRtl ? 'ar' : 'en'}.json');
    setTranslation(
      translation: translation,
    );

    emit(ChangeLanguageState());
  }

  late TranslationModel translationModel;

  void setTranslation({
    required String translation,
  }) {
    translationModel = TranslationModel.fromJson(json.decode(
      translation,
    ));
    emit(LanguageLoaded());
  }

// --------------------------------------getHotels-------------------------------------
  Explore? explore;
  List<HotelData>? hotelData;
  List<HotelData>? sortedHotelData;

  void getHotels() async {
    emit(AppLoading());
    await DioHelper.getData(
      url: 'api/hotels',
    ).then((value) {
      explore = Explore.fromJson(value.data);
      hotelData = explore!.data.data;
      sortedHotelData = explore!.data.data;
      emit(GetHotels());
    });
  }

  // -------------------------------------- create book --------------------------------------

  BookingResponseModel? bookingModel;

  void createBooking({
    required int hotelId,
  }) async {
    emit(AppLoading());
    int userId = CacheHelper.getData(key: 'id');
    String token = CacheHelper.getData(key: 'token');
    final response = await repository.createBooking(
        user_id: userId, hotel_id: hotelId, token: token);
    response.fold(
      (l) {
        emit(ErrorAppState(exception: l));
      },
      (r) async {
        bookingModel = r;
        emit(CreateBooking());
      },
    );
  }

  // -------------------------------------- get booking --------------------------------------

  MainData? userCompletedBooking;

  void getCompletedBooking() async {
    String token = CacheHelper.getData(key: 'token');

    final response = await repository.getBookingData(
      type: 'completed',
      token: token,
    );
    response.fold(
      (l) {
        emit(ErrorAppState(exception: l));
      },
      (r) async {
        userCompletedBooking = r.data;
        emit(GetCompletedBooking());
      },
    );
  }

  MainData? userUpcomingBooking;

  void getUpcomingBooking() async {
    emit(RefreshUpComingBooking());
    String token = CacheHelper.getData(key: 'token');

    final response = await repository.getBookingData(
      type: 'upcoming',
      token: token,
    );
    response.fold(
      (l) {
        emit(ErrorAppState(exception: l));
      },
      (r) async {
        userUpcomingBooking = r.data;
        emit(GetUpComingBooking());
      },
    );
  }

  MainData? userCancelledBooking;

  void getCancelledBooking() async {
    String token = CacheHelper.getData(key: 'token');

    final response = await repository.getBookingData(
      type: 'cancelled',
      token: token,
    );
    response.fold(
      (l) {
        emit(ErrorAppState(exception: l));
      },
      (r) async {
        userCancelledBooking = r.data;
        emit(GetCancelledBooking());
      },
    );
  }

  FacilitiesModel? facilitiesModel;

  void getFacilities() async {
    emit(GetFacilitiesLoadingState());

    final response = await repository.getFacilities();

    response.fold(
      (l) {
        emit(ErrorAppState(exception: l));
      },
      (r) {
        facilitiesModel = r;

        emit(GetFacilitiesSuccessState());
      },
    );
  }

  List<int> selectedFacilities = [];

  void selectFacility(int id) {
    if (selectedFacilities.contains(id)) {
      selectedFacilities.remove(id);
    } else {
      selectedFacilities.add(id);
    }

    emit(SelectFacilityState());
  }

  TextEditingController searchController = TextEditingController();

  Explore? searchHotelsModel;
  List<HotelData>? searchHotelsList;

  void searchHotels() async {
    emit(SearchLoadingState());

    final response = await repository.searchHotels(
      name: searchController.text.isEmpty ? '' : searchController.text,
      facilities: {
        ...selectedFacilities.asMap().map(
              (key, value) => MapEntry(
                'facilities[$key]',
                value,
              ),
            ),
      },
    );

    response.fold(
      (l) {
        emit(ErrorAppState(exception: l));
      },
      (r) {
        searchHotelsModel = r;
        searchHotelsList = searchHotelsModel!.data.data;

        emit(SearchSuccessState());
      },
    );
  }
}
