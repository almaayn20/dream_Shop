import '../../../domain/entities/user_entity.dart';
import 'user.dart';

class UserModel extends UserEntity {
  bool? resp;
  String? msg;
  User? user;
  String? token;

  UserModel({this.resp, this.msg, this.user, this.token})
      : super(
            userUid: user!.uid,
            firstName: user.firstName,
            lastName: user.lastName,
            picture: user.image,
            email: user.email,
            roleId: user.rolId,
            notificationToken: user.notificationToken,
            userToken: token!);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        resp: json['resp'] as bool?,
        msg: json['msg'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String,
      );

  Map<String, dynamic> toJson() => {
        'resp': resp,
        'msg': msg,
        'user': user?.toJson(),
        'token': token,
      };
}
