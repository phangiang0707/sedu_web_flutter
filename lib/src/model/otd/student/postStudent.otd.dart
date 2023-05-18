// To parse this JSON data, do
//
//     final postStudentOtd = postStudentOtdFromJson(jsonString);

import 'dart:convert';

PostStudentOtd postStudentOtdFromJson(String str) =>
    PostStudentOtd.fromJson(json.decode(str));

String postStudentOtdToJson(PostStudentOtd data) => json.encode(data.toJson());

class PostStudentOtd {
  String classroomId;
  String userId;
  String permission;
  Classroom classroom;
  DateTime updatedAt;
  dynamic deletedAt;

  PostStudentOtd({
    required this.classroomId,
    required this.userId,
    required this.permission,
    required this.classroom,
    required this.updatedAt,
    this.deletedAt,
  });

  factory PostStudentOtd.fromJson(Map<String, dynamic> json) => PostStudentOtd(
        classroomId: json["classroomId"],
        userId: json["userId"],
        permission: json["permission"],
        classroom: Classroom.fromJson(json["classroom"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "classroomId": classroomId,
        "userId": userId,
        "permission": permission,
        "classroom": classroom.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Classroom {
  String id;
  String name;
  String? code;
  String description;
  String rules;
  DateTime startDate;
  DateTime endDate;
  bool? archived;
  bool enabled;
  bool deleted;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Classroom? course;
  int? price;
  dynamic imageUrl;
  String? categoryId;

  Classroom({
    required this.id,
    required this.name,
    this.code,
    required this.description,
    required this.rules,
    required this.startDate,
    required this.endDate,
    this.archived,
    required this.enabled,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.course,
    this.price,
    this.imageUrl,
    this.categoryId,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        description: json["description"],
        rules: json["rules"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        archived: json["archived"],
        enabled: json["enabled"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        course:
            json["course"] == null ? null : Classroom.fromJson(json["course"]),
        price: json["price"],
        imageUrl: json["imageUrl"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "description": description,
        "rules": rules,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "archived": archived,
        "enabled": enabled,
        "deleted": deleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "course": course?.toJson(),
        "price": price,
        "imageUrl": imageUrl,
        "categoryId": categoryId,
      };
}
