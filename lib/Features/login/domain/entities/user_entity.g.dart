// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 1;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      userUid: fields[0] as num,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      picture: fields[3] as String?,
      email: fields[4] as String,
      roleId: fields[5] as int,
      notificationToken: fields[6] as String,
      userToken: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.userUid)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.picture)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.roleId)
      ..writeByte(6)
      ..write(obj.notificationToken)
      ..writeByte(7)
      ..write(obj.userToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
