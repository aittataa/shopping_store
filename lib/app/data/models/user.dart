import 'dart:convert';

import 'package:shopping_store/app/data/models/picture.dart';

Users usersFromJson(String str) {
  return Users.fromJson(json.decode(str));
}

class Users {
  final int? limit;
  final int? total;
  final int? pageIndex;
  final int? pageCount;
  final List<User>? myList;

  Users({
    this.limit,
    this.total,
    this.pageIndex,
    this.pageCount,
    this.myList,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        limit: json["count"],
        total: json["total"],
        pageIndex: json["page"],
        pageCount: json["pageCount"],
        myList: json["data"] == null
            ? null
            : List<User>.from(json["data"].map((x) => User.fromJson(x))),
      );
}

class User {
  final String? id;
  final String? accessToken;
  final String? publicId;
  final String? firstname;
  final String? middlename;
  final String? lastname;
  final String? username;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? superLogin;
  final String? gender;
  final String? status;
  final bool? profileCompleted;
  final bool? receiveNotification;
  final bool? emailVerified;
  final String? stripeCustomerId;
  final Picture? picture;

  User({
    this.id,
    this.accessToken,
    this.publicId,
    this.firstname,
    this.middlename,
    this.lastname,
    this.username,
    this.email,
    this.password,
    this.phoneNumber,
    this.superLogin,
    this.gender,
    this.status,
    this.profileCompleted,
    this.receiveNotification,
    this.emailVerified,
    this.stripeCustomerId,
    this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      accessToken: json["access_token"],
      publicId: json["publicId"],
      firstname: json["firstname"],
      middlename: json["middlename"],
      lastname: json["lastname"],
      username: json["username"],
      email: json["email"],
      password: json["password"],
      phoneNumber: json["phone_number"],
      superLogin: json["super_login"],
      gender: json["gender"],
      status: json["status"],
      profileCompleted: json["profile_completed"],
      receiveNotification: json["receive_notification"],
      emailVerified: json["email_verified"],
      stripeCustomerId: json["stripeCustomerId"],
      picture: json["image"] == null ? null : Picture.fromJson(json["image"]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id == null ? null : id,
      "publicId": publicId == null ? null : publicId,
      "firstname": firstname == null ? null : firstname,
      "middlename": middlename == null ? null : middlename,
      "lastname": lastname == null ? null : lastname,
      "username": username == null ? null : username,
      "email": email == null ? null : email,
      "password": password == null ? null : password,
      "phone_number": phoneNumber == null ? null : phoneNumber,
      "super_login": superLogin == null ? null : superLogin,
      "gender": gender == null ? null : gender,
      "status": status == null ? null : status,
      "profile_completed": profileCompleted == null ? null : profileCompleted,
      "receive_notification": receiveNotification == null ? null : receiveNotification,
      "email_verified": emailVerified == null ? null : emailVerified,
      "stripeCustomerId": stripeCustomerId == null ? null : stripeCustomerId,
      "image": picture == null ? null : picture,
    };
  }

  Map<String, dynamic> toUpdate() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "middlename": middlename,
      "phone_number": phoneNumber,
    };
  }

  Map<String, dynamic> toRegister() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "username": username,
      "email": email,
      "password": password,
      "phone_number": phoneNumber,
      "gender": gender,
    };
  }

  Map<String, dynamic> toLogin() {
    return {"email": email, "password": password};
  }
}
