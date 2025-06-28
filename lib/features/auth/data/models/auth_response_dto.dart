import 'package:eccomerce_app/features/auth/domain/entities/auth_response_entity.dart';

class AuthResponseDto extends AuthResponseEntity {
  AuthResponseDto({super.token, super.user, super.statusMsg, super.message ,super.errors});
  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      token: json['token'] as String?,
      user: json['user'] != null ? UserDto.fromJson(json['user']) : null,
      statusMsg: json['statusMsg'] as String?,
      message: json['message'] as String?,
      errors: json['errors'] != null ?ErrorsDto.fromJson(json['errors']) :null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': (user is UserDto) ? (user as UserDto).toJson() : null,
      'statusMsg': statusMsg,
      'message': message,
    };
  }
}

class UserDto extends User {
  UserDto({required super.name, required super.email, required super.role});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'role': role};
  }
}

class ErrorsDto extends Errors{
  ErrorsDto({required super.value, required super.msg, required super.param ,required super.location});
  factory ErrorsDto.fromJson(Map<String, dynamic> json) {
    return ErrorsDto(
      value: json['value'] as String,
      msg: json['msg'] as String,
      param: json['param'] as String,
      location: json['location'] as String,

    );
  }
  Map<String, dynamic> toJson() {
    return {'value': value, 'msg': msg, 'param': param ,'location':location};
  }
}
