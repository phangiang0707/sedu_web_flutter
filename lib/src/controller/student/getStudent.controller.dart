import '../../model/otd/student/getStuden.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class GetStudentController {
  Future<List<GetStudentOtd>?> getStudent(String id) async {
    final response =
        await http.get(Uri.parse('${url}classrooms/${id}/students'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
