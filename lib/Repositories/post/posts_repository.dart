import 'package:trilhaapp/model/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
}
