import 'package:trilhaapp/Repositories/jsonplaceholder_custon_dio.dart';
import 'package:trilhaapp/Repositories/post/posts_repository.dart';
import 'package:trilhaapp/model/post_model.dart';

class PostDioRepository implements PostsRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var jsonplaceHolder = JsonplaceholderCustonDio();
    var response = await jsonplaceHolder.getDio().get('/posts');
    if (response.statusCode == 200) {
      return (response.data as List).map((json) => PostModel.fromJson(json)).toList();
    } else {
      return [];
    }
    
  }
}
