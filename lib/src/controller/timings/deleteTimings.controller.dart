import '../../model/otd/timings/postTiming.otd.dart';
import 'package:http/http.dart' as http;

import '../../utils/url.dart';

class DeleteTimingsController {
  Future<PostTimingsOtd?> deleteTimings(String timingId, String id) async {
    final response = await http
        .delete(Uri.parse('${url}classrooms/${id}/timings/${timingId}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return postTimingsOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
