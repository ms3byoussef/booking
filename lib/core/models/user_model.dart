class UserModel {
  final int? id;
  final String? token;
  final String? name;
  final String? email;
  final String? image;

  UserModel({
    this.id,
    this.token,
    this.name,
    this.email,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      token: json['api_token'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
    );
  }
}
