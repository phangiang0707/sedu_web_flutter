import 'package:http/http.dart' as http;

import '../../model/otd/category/postCategory.otd.dart';
import '../../utils/url.dart';

class PutCategoryControllerr {
  Future<PostCategoryOtd?> putCategory(
      String id, String name, String description) async {
    var response = await http.put(Uri.parse('${url}categories/$id'),
        body: {"name": name, "description": description});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return postCategoryOtdFromJson(response.body);
      //return loginEmailOtdFromJson(json.decode(response.body)['data']);
    } else {
      print('Error');
      return null;
    }
  }
}
