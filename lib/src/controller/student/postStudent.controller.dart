import '../../model/otd/student/postStudent.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class PostStudentController {
  Future<PostStudentOtd?> postStudent(String idStudent, String id) async {
    final response = await http.post(
      Uri.parse('${url}classrooms/${id}/students/add'),
      body: {"studentId": idStudent},
      // headers: {
      //   "Content-Type": "application/json",
      // },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return postStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
