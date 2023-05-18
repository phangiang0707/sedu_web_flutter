import 'package:http/http.dart' as http;

import '../../model/otd/courses/postCourse.otd.dart';
import '../../utils/url.dart';

class DeleteCourseControllerr {
  Future<PostCourseOtd?> deleteCourse(String id) async {
    var response = await http.delete(
      Uri.parse('${url}courses/$id'),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return postCourseOtdFromJson(response.body);
    } else {
      print('Error');
      return null;
    }
  }
}
