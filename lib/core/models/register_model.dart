import 'package:booking_app_algoriza/core/models/user_model.dart';

import 'status_model.dart';

class RegisterModel {
  final StatusModel status;
  final UserModel? data;

  RegisterModel({
    required this.status,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: StatusModel.fromJson(json['status']),
      data: UserModel.fromJson(json['data']),
    );
  }
}
