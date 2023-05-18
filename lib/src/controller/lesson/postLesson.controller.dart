import '../../model/otd/lesson/postLesson.otd.dart';

import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class PostLessonController {
  Future<PostLessonOtd?> postLessonOtd(
      PostLessonOtd postLessonOtd, String id) async {
    final response = await http.post(
      Uri.parse('${url}courses/${id}/lessons/add'),
      body: postLessonOtdToJson(postLessonOtd),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print('${url}courses/${id}/lessons/add');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return postLessonOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
