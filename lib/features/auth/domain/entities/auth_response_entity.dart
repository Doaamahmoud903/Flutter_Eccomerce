import 'package:hive/hive.dart';
part 'auth_response_entity.g.dart';

@HiveType(typeId: 1)
class AuthResponseEntity extends HiveObject{
  @HiveField(0)
  final String? statusMsg;
  @HiveField(1)
  final String? message;
  @HiveField(2)
  final User? user;
  @HiveField(3)
  final String? token;

  AuthResponseEntity({
    required this.statusMsg,
    required this.message,
    required this.user,
    required this.token,
  });
}

@HiveType(typeId: 2)
class User {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String role;

  User({required this.name, required this.email, required this.role});
}
