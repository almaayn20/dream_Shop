import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity {
  @HiveField(0)
  final num userUid;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String? picture;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final int roleId;
  @HiveField(6)
  final String notificationToken;
  @HiveField(7)
  final String userToken;

  UserEntity(
      {required this.userUid,
      required this.firstName,
      required this.lastName,
      required this.picture,
      required this.email,
      required this.roleId,
      required this.notificationToken,
      required this.userToken});
}
