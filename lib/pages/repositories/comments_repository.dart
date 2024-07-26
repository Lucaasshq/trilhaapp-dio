import 'dart:convert';

import '../../model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentsRepository {
  Future<List<CommentModel>> getComements() async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List).map((json) => CommentModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
