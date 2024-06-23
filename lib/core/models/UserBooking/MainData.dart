// ignore_for_file: file_names

import 'package:booking_app_algoriza/core/models/UserBooking/booking_data.dart';

import 'links.dart';

class MainData {
  MainData({
    required this.currentPage,
    this.bookingData,
    required this.links,
    required this.path,
    required this.total,
  });

  MainData.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      bookingData = [];
      json['data'].forEach((v) {
        bookingData!.add(BookingData.fromJson(v));
      });
    }
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    total = json['total'];
  }

  late int currentPage;
  List<BookingData>? bookingData;
  late List<Links> links;
  late String path;
  late int total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (bookingData != null) {
      map['data'] = bookingData!.map((v) => v.toJson()).toList();
    }
    map['links'] = links.map((v) => v.toJson()).toList();
    map['path'] = path;
    map['total'] = total;
    return map;
  }
}
