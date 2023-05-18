import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/otd/lesson/getLesson.otd.dart';
import '../../utils/url.dart';

class GetLessonController {
  Future<List<GetLessonOtd>> getLesson(String id) async {
    final response = await http.get(Uri.parse('${url}courses/${id}/lessons'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return getLessonOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
