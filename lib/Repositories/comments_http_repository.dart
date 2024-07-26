import 'dart:convert';

import '../model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentsHttpRepository {
  Future<List<CommentModel>> getComements(int postId) async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List).map((json) => CommentModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
