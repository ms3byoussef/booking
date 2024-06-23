// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:io';

import 'package:booking_app_algoriza/core/model/Explore/explore.dart';
import 'package:booking_app_algoriza/core/models/Booking/booking_response_model.dart';
import 'package:booking_app_algoriza/core/models/UserBooking/user_booking.dart';
import 'package:booking_app_algoriza/core/models/facilities_model.dart';
import 'package:booking_app_algoriza/core/models/register_model.dart';
import 'package:booking_app_algoriza/core/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../errors/exceptions.dart';
import '../models/login_model.dart';
import '../models/profile_model.dart';
import 'dio_helper.dart';
import 'end_points.dart';

abstract class Repository {
  Future<Either<ServerException, LoginModel>> login({
    required String email,
    required String password,
  });

  Future<Either<ServerException, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<Either<ServerException, ProfileModel>> getProfile({
    required String token,
  });

  Future<Either<ServerException, UserModel>> updateProfile({
    required String token,
    required String name,
    required String email,
    required File image,
  });

  Future<Either<ServerException, BookingResponseModel>> createBooking({
    required int user_id,
    required int hotel_id,
    required String token,
  });

  Future<Either<ServerException, UserBooking>> getBookingData({
    required String type,
    required String token,
  });
  Future<Either<ServerException, Explore>> searchHotels({
    required Map<String, int> facilities,
    required String name,
  });

  Future<Either<ServerException, FacilitiesModel>> getFacilities();
}

class RepositoryImplementation extends Repository {
  final DioHelper dioHelper;

  RepositoryImplementation({
    required this.dioHelper,
  });

  @override
  Future<Either<ServerException, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    return basicErrorHandling<LoginModel>(
      onSuccess: () async {
        final response = await DioHelper.postData(
          url: '$baseApiUrl$version$loginEndPoint',
          data: {
            'email': email,
            'password': password,
          },
        );

        return LoginModel.fromJson(response.data);
      },
      onServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<ServerException, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    return basicErrorHandling<RegisterModel>(
      onSuccess: () async {
        final response = await DioHelper.postData(
          url: '$baseApiUrl$version$registerEndPoint',
          data: {
            'name': name,
            'email': email,
            'password': password,
            'password_confirmation': confirmPassword,
          },
        );

        return RegisterModel.fromJson(response.data);
      },
      onServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<ServerException, ProfileModel>> getProfile({
    required String token,
  }) async {
    return basicErrorHandling<ProfileModel>(
      onSuccess: () async {
        final response = await DioHelper.getData(
            url: '$baseApiUrl$version$profileEndPoint',
            token: token,
            headers: {'token': token});

        debugPrint(response.data.toString());
        return ProfileModel.fromJson(response.data);
      },
      onServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<ServerException, UserModel>> updateProfile({
    required String token,
    required String name,
    required String email,
    required File image,
  }) async {
    return basicErrorHandling<UserModel>(
      onSuccess: () async {
        final response = await DioHelper.postData(
          url: '$baseApiUrl$version$updateProfileEndPoint',
          token: token,
          // isMultipart: true,
          data: FormData.fromMap({
            'name': name,
            'email': email,
            'image': await MultipartFile.fromFile(
              image.path,
              filename: Uri.file(image.path).pathSegments.last,
            ),
          }),
        );

        return UserModel.fromJson(response.data);
      },
      onServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<ServerException, BookingResponseModel>> createBooking(
      {required int user_id,
      required int hotel_id,
      required String token}) async {
    return basicErrorHandling<BookingResponseModel>(
      onSuccess: () async {
        final response = await DioHelper.postData(
            url: '$baseApiUrl$version$booking',
            data: {
              'user_id': user_id,
              'hotel_id': hotel_id,
            },
            token: token);

        return BookingResponseModel.fromJson(response.data);
      },
      onServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<ServerException, UserBooking>> getBookingData({
    required String type,
    required String token,
  }) async {
    return basicErrorHandling<UserBooking>(
      onSuccess: () async {
        final response = await DioHelper.getData(
          url: '$baseApiUrl$version$getBooking',
          headers: {'token': token},
          query: {'type': type},
        );

        return UserBooking.fromJson(response.data);
      },
      onServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<ServerException, Explore>> searchHotels({
    required Map<String, int> facilities,
    required String name,
  }) async {
    return basicErrorHandling<Explore>(
      onSuccess: () async {
        final response = await DioHelper.getData(
          url: '$baseApiUrl$version$searchEndPoint',
          query: {
            'name': name,
            ...facilities,
            'count': 10,
            'page': 1,
          },
        );

        return Explore.fromJson(response.data);
      },
      onServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<ServerException, FacilitiesModel>> getFacilities() async {
    return basicErrorHandling<FacilitiesModel>(
      onSuccess: () async {
        final response = await DioHelper.getData(
          url: '$baseApiUrl$version$facilitiesEndPoint',
        );

        return FacilitiesModel.fromJson(response.data);
      },
      onServerException: (e) async {
        return e;
      },
    );
  }
}

extension on Repository {
  Future<Either<ServerException, T>> basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<ServerException> Function(ServerException exception)?
        onServerException,
  }) async {
    try {
      final r = await onSuccess();
      debugPrint(r.toString());
      return Right(r);
    } on ServerException catch (e, s) {
      debugPrint(s.toString());
      return Left(e);
    }
  }
}
