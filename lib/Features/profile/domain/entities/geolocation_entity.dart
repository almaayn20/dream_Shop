import 'package:hive/hive.dart';
part 'geolocation_entity.g.dart';

@HiveType(typeId: 10)
class GeolocationEntity {
  @HiveField(0)
  final String? lat;
  @HiveField(1)
  final String? lng;

  GeolocationEntity({required this.lat, required this.lng});
}
