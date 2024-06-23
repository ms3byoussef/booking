class UserRegisterModel {
  final int id;
  final String name;
  final String email;

  UserRegisterModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
