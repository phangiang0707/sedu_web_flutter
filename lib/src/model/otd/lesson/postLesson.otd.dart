// To parse this JSON data, do
//
//     final postLessonOtd = postLessonOtdFromJson(jsonString);

import 'dart:convert';

PostLessonOtd postLessonOtdFromJson(String str) =>
    PostLessonOtd.fromJson(json.decode(str));

String postLessonOtdToJson(PostLessonOtd data) => json.encode(data.toJson());

class PostLessonOtd {
  int lessonNo;
  String title;
  String content;
  String type;
  bool enabled;

  PostLessonOtd({
    required this.lessonNo,
    required this.title,
    required this.content,
    required this.type,
    required this.enabled,
  });

  factory PostLessonOtd.fromJson(Map<String, dynamic> json) => PostLessonOtd(
        lessonNo: json["lessonNo"],
        title: json["title"],
        content: json["content"],
        type: json["type"],
        enabled: json["enabled"],
      );

  Map<String, dynamic> toJson() => {
        "lessonNo": lessonNo,
        "title": title,
        "content": content,
        "type": type,
        "enabled": enabled,
      };
}
