import 'package:ai_weather/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String email;
  final String name;
  UserModel({
    required this.id,
    required this.email,
    required this.name,
  });
  UserEntity toEntity() {
    return UserEntity(email: email, name: name);
  }
}
