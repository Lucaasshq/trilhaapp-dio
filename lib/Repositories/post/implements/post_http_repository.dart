import 'dart:convert';

import 'package:trilhaapp/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostHttpRepository {
  Future<List<PostModel>> getPosts() async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var jsonPost = jsonDecode(response.body);
      return (jsonPost as List).map((post) => PostModel.fromJson(post)).toList();
    } else {
      return [];
    }
  }
}
