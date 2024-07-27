import '../../model/comment_model.dart';

abstract class CommentsRepository {
  Future<List<CommentModel>> getComements(int postId);
}
