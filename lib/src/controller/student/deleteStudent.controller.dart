import '../../model/otd/student/postStudent.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class DeleteStudentController {
  Future<PostStudentOtd?> deleteStudent(String idStudent, String id) async {
    final response = await http.delete(
      Uri.parse('${url}classrooms/${id}/students/${idStudent}'),
      body: {"studentId": idStudent},
      // headers: {
      //   "Content-Type": "application/json",
      // },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return postStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
