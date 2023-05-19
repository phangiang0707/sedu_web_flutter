// To parse this JSON data, do
//
//     final postUserOtd = postUserOtdFromJson(jsonString);

import 'dart:convert';

PostUserOtd postUserOtdFromJson(String str) =>
    PostUserOtd.fromJson(json.decode(str));

String postUserOtdToJson(PostUserOtd data) => json.encode(data.toJson());

class PostUserOtd {
  String name;
  String email;
  String phone;
  String avatarUrl;
  DateTime birthday;

  PostUserOtd({
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.birthday,
  });

  factory PostUserOtd.fromJson(Map<String, dynamic> json) => PostUserOtd(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        avatarUrl: json["avatarUrl"],
        birthday: DateTime.parse(json["birthday"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "avatarUrl": avatarUrl,
        "birthday": birthday.toIso8601String(),
      };
}
