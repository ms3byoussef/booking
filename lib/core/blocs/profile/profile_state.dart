import 'package:flutter/material.dart';

import '../../errors/exceptions.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UserProfileLoadingState extends ProfileState {}

class UserProfileSuccessState extends ProfileState {}

class ErrorState extends ProfileState {
  final ServerException exception;

  ErrorState({
    required this.exception,
  });
}
