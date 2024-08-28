import 'package:foody/Features/profile/domain/entities/profile_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'address.dart';
import 'name.dart';

class Profile extends ProfileEntity {
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? v;

  Profile({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.v,
  }) : super(
            userAddress: address!.geolocation,
            userId: id!,
            userEmail: email!,
            userUsername: username,
            userName: '${name!.firstname} ${name.lastname!}',
            userPhone: phone);

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        id: json['id'] as int?,
        email: json['email'] as String?,
        username: json['username'] as String?,
        password: json['password'] as String?,
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        phone: json['phone'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'address': address?.toJson(),
        'id': id,
        'email': email,
        'username': username,
        'password': password,
        'name': name?.toJson(),
        'phone': phone,
        '__v': v,
      };
}
