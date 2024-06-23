// ignore_for_file: file_names

import 'Title.dart';

class Status {
  Status({
    required this.type,
    required this.title,
    required this.bookingId,
  });

  Status.fromJson(dynamic json) {
    type = json['type'];
    title = (json['title'] != null ? Title.fromJson(json['title']) : null)!;
    bookingId = json['booking_id'];
  }
  late String type;
  late Title title;
  late int bookingId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['title'] = title.toJson();
    map['booking_id'] = bookingId;
    return map;
  }
}
