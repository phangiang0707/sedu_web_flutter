import 'package:http/http.dart' as http;

import '../../model/otd/courses/postCourse.otd.dart';
import '../../utils/url.dart';

class PutCourseControllerr {
  Future<PostCourseOtd?> putCourse(PostCourseOtd data, String id) async {
    var response = await http.put(
      Uri.parse('${url}courses/$id'),
      body: postCourseOtdToJson(data),
      headers: {
        "Content-Type": "application/json",
      },
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
