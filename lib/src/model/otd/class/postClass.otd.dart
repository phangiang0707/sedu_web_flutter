// To parse this JSON data, do
//
//     final postClassOtd = postClassOtdFromJson(jsonString);

import 'dart:convert';

PostClassOtd postClassOtdFromJson(String str) =>
    PostClassOtd.fromJson(json.decode(str));

String postClassOtdToJson(PostClassOtd data) => json.encode(data.toJson());

class PostClassOtd {
  String name;
  String code;
  String description;
  String courseId;
  String rules;
  DateTime startDate;
  DateTime endDate;

  PostClassOtd({
    required this.name,
    required this.code,
    required this.description,
    required this.courseId,
    required this.rules,
    required this.startDate,
    required this.endDate,
  });

  factory PostClassOtd.fromJson(Map<String, dynamic> json) => PostClassOtd(
        name: json["name"],
        code: json["code"],
        description: json["description"],
        courseId: json["courseId"],
        rules: json["rules"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "description": description,
        "courseId": courseId,
        "rules": rules,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
      };
}
