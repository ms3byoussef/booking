// ignore_for_file: unnecessary_null_comparison

import 'status.dart';

class BookingResponseModel {
  BookingResponseModel({
    required this.status,
  });

  BookingResponseModel.fromJson(dynamic json) {
    status = (json['status'] != null ? Status.fromJson(json['status']) : null)!;
  }

  late Status status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status.toJson();
    }
    return map;
  }
}
