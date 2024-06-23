// ignore_for_file: file_names

import 'MainData.dart';

class UserBooking {
  UserBooking({
    required this.data,
  });

  UserBooking.fromJson(dynamic json) {
    data = (json['data'] != null ? MainData.fromJson(json['data']) : null)!;
  }
  late MainData data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data.toJson();
    return map;
  }
}
