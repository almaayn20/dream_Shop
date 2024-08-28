import 'package:foody/Features/profile/domain/entities/geolocation_entity.dart';

class Geolocation extends GeolocationEntity {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long}) : super(lat: lat, lng: long);

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
        lat: json['lat'] as String?,
        long: json['long'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'long': long,
      };
}
