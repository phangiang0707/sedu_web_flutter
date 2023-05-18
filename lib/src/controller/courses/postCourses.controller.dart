import 'package:http/http.dart' as http;

import '../../model/otd/courses/postCourse.otd.dart';
import '../../utils/url.dart';

class PostCourseControllerr {
  Future<PostCourseOtd?> postCourse(PostCourseOtd data) async {
    var response = await http.post(
      Uri.parse('${url}courses'),
      body: postCourseOtdToJson(data),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      return postCourseOtdFromJson(response.body);
    } else {
      print('Error');
      return null;
    }
  }
}
