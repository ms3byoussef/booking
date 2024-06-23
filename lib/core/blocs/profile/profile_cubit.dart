// ignore_for_file: avoid_print

import 'package:booking_app_algoriza/core/blocs/profile/profile_state.dart';
import 'package:booking_app_algoriza/core/models/user_model.dart';
import 'package:booking_app_algoriza/core/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/constants.dart';
import '../../models/profile_model.dart';
import '../../network/repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Repository repository;

  ProfileCubit({required this.repository}) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);
  ProfileModel? profileModel;
  UserModel? user;

  void userProfile() async {
    emit(UserProfileLoadingState());
    debugPrint("__________________${token}________________________");
    token = await CacheHelper.getData(key: "token");
    final response = await repository.getProfile(token: token!);

    response.fold(
      (l) {
        emit(ErrorState(exception: l));
      },
      (r) {
        profileModel = r;
        user = r.data;

        emit(UserProfileSuccessState());
      },
    );
  }
}
