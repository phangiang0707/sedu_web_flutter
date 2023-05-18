import '../../model/otd/lesson/postLesson.otd.dart';

import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class PutLessonController {
  Future<PostLessonOtd?> putLessonController(
      String id, String lessonID, PostLessonOtd postLessonOtd) async {
    final response = await http.put(
      Uri.parse('${url}courses/${id}/lessons/${lessonID}'),
      body: postLessonOtdToJson(postLessonOtd),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print('${url}courses/${id}/lessons/${lessonID}');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return postLessonOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
