import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/otd/courses/getCourse.otd.dart';
import '../../utils/url.dart';

class GetCoursesController {
  Future<List<GetCourseOtd>> getCourses() async {
    final response = await http.get(Uri.parse('${url}courses'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return getCourseOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
