// To parse this JSON data, do
//
//     final getClassOtd = getClassOtdFromJson(jsonString);

import 'dart:convert';

List<GetClassOtd> getClassOtdFromJson(String str) => List<GetClassOtd>.from(
    json.decode(str).map((x) => GetClassOtd.fromJson(x)));

String getClassOtdToJson(List<GetClassOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetClassOtd {
  String id;
  String name;
  String code;
  String description;
  DateTime startDate;
  DateTime endDate;
  Course course;

  GetClassOtd({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.course,
  });

  factory GetClassOtd.fromJson(Map<String, dynamic> json) => GetClassOtd(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        description: json["description"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        course: Course.fromJson(json["course"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "description": description,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "course": course.toJson(),
      };
}

class Course {
  String id;
  String name;
  String description;

  Course({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
