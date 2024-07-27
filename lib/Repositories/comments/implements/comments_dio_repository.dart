import 'package:dio/dio.dart';
import 'package:trilhaapp/Repositories/comments/comments_repository.dart';
import 'package:trilhaapp/Repositories/jsonplaceholder_custon_dio.dart';

import '../../../model/comment_model.dart';

class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> getComements(int postId) async {
    var jsonplaceholder = JsonplaceholderCustonDio();
    var response = await jsonplaceholder.getDio().get('/posts/$postId/comments');
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
    }
    throw UnimplementedError();
  }
}
