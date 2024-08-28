import 'package:foody/Features/profile/domain/entities/geolocation_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
part 'profile_entity.g.dart';

@HiveType(typeId: 9)
class ProfileEntity {
  @HiveField(0)
  final GeolocationEntity? userAddress;
  @HiveField(1)
  final int? userId;
  @HiveField(2)
  final String? userEmail;
  @HiveField(3)
  final String? userUsername;
  @HiveField(4)
  final String? userName;
  @HiveField(5)
  final String? userPhone;

  ProfileEntity(
      {required this.userAddress,
      required this.userId,
      required this.userEmail,
      required this.userUsername,
      required this.userName,
      required this.userPhone});
}
