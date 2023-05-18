import '../../model/otd/lesson/postLesson.otd.dart';

import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class DeleteLessonController {
  Future<PostLessonOtd?> deleteLesson(String id, String lessonID) async {
    final response = await http.delete(
      Uri.parse('${url}courses/${id}/lessons/${lessonID}'),
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
