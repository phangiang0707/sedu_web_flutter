// To parse this JSON data, do
//
//     final postTimingsOtd = postTimingsOtdFromJson(jsonString);

import 'dart:convert';

PostTimingsOtd postTimingsOtdFromJson(String str) =>
    PostTimingsOtd.fromJson(json.decode(str));

String postTimingsOtdToJson(PostTimingsOtd data) => json.encode(data.toJson());

class PostTimingsOtd {
  String teacherId;
  int day;
  String startTime;
  String endTime;

  PostTimingsOtd({
    required this.teacherId,
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  factory PostTimingsOtd.fromJson(Map<String, dynamic> json) => PostTimingsOtd(
        teacherId: json["teacherId"],
        day: json["day"],
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "teacherId": teacherId,
        "day": day,
        "startTime": startTime,
        "endTime": endTime,
      };
}
