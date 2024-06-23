// ignore_for_file: file_names

import 'hotel.dart';
import 'user.dart';

class BookingData {
  BookingData({
    this.id,
    this.userId,
    this.hotelId,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.hotel,
  });

  BookingData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = (json['user'] != null ? User.fromJson(json['user']) : null)!;
    hotel = (json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null)!;
  }

  int? id;
  String? userId;
  String? hotelId;
  String? type;
  String? createdAt;
  String? updatedAt;
  User? user;
  Hotel? hotel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['hotel_id'] = hotelId;
    map['type'] = type;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    if (hotel != null) {
      map['hotel'] = hotel!.toJson();
    }
    return map;
  }
}
