import 'status_model.dart';
import 'user_model.dart';

class UpdateProfileModel {
  final StatusModel status;
  final UserModel data;

  UpdateProfileModel({
    required this.status,
    required this.data,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      status: StatusModel.fromJson(json['status']),
      data: UserModel.fromJson(json['data']),
    );
  }
}
