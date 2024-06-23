// ignore_for_file: file_names

import 'facilities.dart';

class Hotel {
  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
    required this.facilities,
  });

  Hotel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['facilities'] != null) {
      facilities = [];
      json['facilities'].forEach((v) {
        facilities.add(Facilities.fromJson(v));
      });
    }
  }
  late int id;
  late String name;
  late String description;
  late String price;
  late String address;
  late String longitude;
  late String latitude;
  late String rate;
  late String createdAt;
  late String updatedAt;
  late List<Facilities> facilities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['address'] = address;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    map['rate'] = rate;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['facilities'] = facilities.map((v) => v.toJson()).toList();
    return map;
  }
}
