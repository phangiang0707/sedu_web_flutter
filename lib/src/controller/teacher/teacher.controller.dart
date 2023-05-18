import '../../model/otd/teacher/teacher.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class GetTeacherController {
  Future<List<GetTeacherOtd>?> getTeacher(String id) async {
    final response =
        await http.get(Uri.parse('${url}classrooms/${id}/teachers'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getTeacherOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
