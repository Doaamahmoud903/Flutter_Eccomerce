// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthResponseEntityAdapter extends TypeAdapter<AuthResponseEntity> {
  @override
  final int typeId = 1;

  @override
  AuthResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthResponseEntity(
      statusMsg: fields[0] as String?,
      message: fields[1] as String?,
      user: fields[2] as User?,
      token: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthResponseEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.statusMsg)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 2;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String,
      email: fields[1] as String,
      role: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
