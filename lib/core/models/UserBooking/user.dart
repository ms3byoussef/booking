// ignore_for_file: file_names

class User {
  User({
      required this.id,
      required this.name,
      required this.email,
      this.emailVerifiedAt, 
      required this.apiToken,
      this.image, 
      required this.createdAt,
      required this.updatedAt,
      this.googleId, 
      this.provider,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    apiToken = json['api_token'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    googleId = json['google_id'];
    provider = json['provider'];
  }
  late int id;
  late String name;
  late String email;
  dynamic emailVerifiedAt;
  late String apiToken;
  dynamic image;
  late String createdAt;
  late String updatedAt;
  dynamic googleId;
  dynamic provider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['api_token'] = apiToken;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['google_id'] = googleId;
    map['provider'] = provider;
    return map;
  }

}