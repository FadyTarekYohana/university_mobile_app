import 'package:http/http.dart' as http;

import '../model/post.dart';
import '../util/user_preferences.dart';

class PostsService {
  getUniversities() async {
    var client = http.Client();

    var uri = Uri.parse(
        "http://universities.hipolabs.com/search?country=${await UserSimplePreferences.getCountry()}");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      String jsonString = response.body;
      return postFromJson(jsonString);
    }
  }
}
