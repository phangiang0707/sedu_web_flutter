import 'package:http/http.dart' as http;

import '../../model/otd/category/postCategory.otd.dart';
import '../../utils/url.dart';

class DeleteCategoryControllerr {
  Future<String> deleteCategory(String id) async {
    var response = await http.delete(Uri.parse('${url}categories/$id'));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      print('Done');
      return 'Done';
      //return loginEmailOtdFromJson(json.decode(response.body)['data']);
    } else {
      print('Error');
      return 'Error';
    }
  }
}
