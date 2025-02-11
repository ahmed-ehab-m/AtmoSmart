import 'package:ai_weather/features/auth/domain/entities/userEntity.dart';

class UserModel {
  final String id;
  final String email;
  // final String name;
  final String password;
  UserModel({
    required this.id,
    required this.email,
    // required this.name,
    required this.password,
  });
  factory UserModel.fromFirebase(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      // name: json['name'],
      password: json['password'],
    );
  }
  UserEntity toEntity() {
    return UserEntity(email: email, password: password);
  }
}
