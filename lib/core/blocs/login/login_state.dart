import 'package:flutter/material.dart';

import '../../errors/exceptions.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class UserLoginLoadingState extends LoginState {}

class UserLoginSuccessState extends LoginState {}

class ErrorState extends LoginState {
  final ServerException exception;

  ErrorState({
    required this.exception,
  });
}
