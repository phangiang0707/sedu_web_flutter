// To parse this JSON data, do
//
//     final getLessonOtd = getLessonOtdFromJson(jsonString);

import 'dart:convert';

List<GetLessonOtd> getLessonOtdFromJson(String str) => List<GetLessonOtd>.from(
    json.decode(str).map((x) => GetLessonOtd.fromJson(x)));

String getLessonOtdToJson(List<GetLessonOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetLessonOtd {
  String id;
  int lessonNo;
  String title;
  String content;
  String type;
  bool enabled;
  bool deleted;
  DateTime createdAt;
  DateTime updatedAt;

  GetLessonOtd({
    required this.id,
    required this.lessonNo,
    required this.title,
    required this.content,
    required this.type,
    required this.enabled,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetLessonOtd.fromJson(Map<String, dynamic> json) => GetLessonOtd(
        id: json["id"],
        lessonNo: json["lessonNo"],
        title: json["title"],
        content: json["content"],
        type: json["type"],
        enabled: json["enabled"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lessonNo": lessonNo,
        "title": title,
        "content": content,
        "type": type,
        "enabled": enabled,
        "deleted": deleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
