// To parse this JSON data, do
//
//     final getTimingsOtd = getTimingsOtdFromJson(jsonString);

import 'dart:convert';

List<GetTimingsOtd> getTimingsOtdFromJson(String str) =>
    List<GetTimingsOtd>.from(
        json.decode(str).map((x) => GetTimingsOtd.fromJson(x)));

String getTimingsOtdToJson(List<GetTimingsOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetTimingsOtd {
  String id;
  int day;
  String startTime;
  String endTime;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  GetTimingsOtd({
    required this.id,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory GetTimingsOtd.fromJson(Map<String, dynamic> json) => GetTimingsOtd(
        id: json["id"],
        day: json["day"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
