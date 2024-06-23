import 'status_model.dart';
import 'user_model.dart';

class ProfileModel {
  final StatusModel status;
  final UserModel data;

  ProfileModel({
    required this.status,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: StatusModel.fromJson(json['status']),
      data: UserModel.fromJson(json['data']),
    );
  }
}
