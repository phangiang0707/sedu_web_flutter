// To parse this JSON data, do
//
//     final getTeacherOtd = getTeacherOtdFromJson(jsonString);

import 'dart:convert';

List<GetTeacherOtd> getTeacherOtdFromJson(String str) =>
    List<GetTeacherOtd>.from(
        json.decode(str).map((x) => GetTeacherOtd.fromJson(x)));

String getTeacherOtdToJson(List<GetTeacherOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetTeacherOtd {
  String classroomId;
  String userId;
  String permission;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  GetTeacherOtd({
    required this.classroomId,
    required this.userId,
    required this.permission,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory GetTeacherOtd.fromJson(Map<String, dynamic> json) => GetTeacherOtd(
        classroomId: json["classroomId"],
        userId: json["userId"],
        permission: json["permission"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "classroomId": classroomId,
        "userId": userId,
        "permission": permission,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
