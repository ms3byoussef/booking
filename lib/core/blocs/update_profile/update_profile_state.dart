import 'package:flutter/material.dart';

import '../../errors/exceptions.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UserUpdateProfileLoadingState extends UpdateProfileState {}

class UserUpdateProfileSuccessState extends UpdateProfileState {}

class PickedImageLoadingState extends UpdateProfileState {}

class PickedImageSuccessState extends UpdateProfileState {}

class ErrorState extends UpdateProfileState {
  final ServerException exception;

  ErrorState({
    required this.exception,
  });
}
