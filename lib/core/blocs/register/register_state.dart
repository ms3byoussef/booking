import 'package:flutter/material.dart';

import '../../errors/exceptions.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class UserRegisterLoadingState extends RegisterState {}

class UserRegisterSuccessState extends RegisterState {}

class ErrorState extends RegisterState {
  final ServerException exception;

  ErrorState({
    required this.exception,
  });
}
