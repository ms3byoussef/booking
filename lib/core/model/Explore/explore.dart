// ignore_for_file: file_names

import 'package:booking_app_algoriza/core/model/Explore/Data.dart';
import 'package:booking_app_algoriza/core/model/Explore/status.dart';

class Explore {
  Explore({
    required this.status,
    required this.data,
  });

  Explore.fromJson(dynamic json) {
    status = (json['status'] != null ? Status.fromJson(json['status']) : null)!;
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }

  late Status status;
  late Data data;
}
