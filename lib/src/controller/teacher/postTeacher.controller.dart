import 'package:http/http.dart' as http;

import '../../model/otd/teacher/postTeacher.otd.dart';
import '../../utils/url.dart';

class PostTeacherController {
  Future<PostTeacherOtd?> postTeacher(String idTeacher, String id) async {
    final response = await http.post(
      Uri.parse('${url}classrooms/${id}/teachers/add'),
      body: {"teacherId": idTeacher},
      // headers: {
      //   "Content-Type": "application/json",
      // },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return postTeacherOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
