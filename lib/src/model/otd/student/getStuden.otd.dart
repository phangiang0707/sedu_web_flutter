// To parse this JSON data, do
//
//     final getStudentOtd = getStudentOtdFromJson(jsonString);

import 'dart:convert';

List<GetStudentOtd> getStudentOtdFromJson(String str) =>
    List<GetStudentOtd>.from(
        json.decode(str).map((x) => GetStudentOtd.fromJson(x)));

String getStudentOtdToJson(List<GetStudentOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStudentOtd {
  String classroomId;
  String userId;
  String permission;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  GetStudentOtd({
    required this.classroomId,
    required this.userId,
    required this.permission,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory GetStudentOtd.fromJson(Map<String, dynamic> json) => GetStudentOtd(
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
