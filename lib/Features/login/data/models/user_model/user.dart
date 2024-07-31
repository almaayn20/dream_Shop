// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  num uid;
  String firstName;
  String lastName;
  String? image;
  String email;
  int rolId;
  String notificationToken;
  User({
    required this.uid,
    required this.firstName,
    required this.lastName,
    this.image,
    required this.email,
    required this.rolId,
    required this.notificationToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json['uid'] as num,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        image: json['image'] as String?,
        email: json['email'] as String,
        rolId: json['rol_id'] as int,
        notificationToken: json['notification_token'] as String,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'image': image,
        'email': email,
        'rol_id': rolId,
        'notification_token': notificationToken,
      };
}
