import '../../model/otd/teacher/teacher.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class DeleteTeacherController {
  Future<List<GetTeacherOtd>?> deleteTeacher(
      String teacherId, String id) async {
    final response = await http
        .delete(Uri.parse('${url}classrooms/${id}/teachers/${teacherId}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getTeacherOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
