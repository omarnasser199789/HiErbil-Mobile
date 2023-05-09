
import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/posts/domain/entities/post_entity.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/blog_categories_entity.dart';
import '../repositories/posts_repository.dart';


class GetPostByIdUseCase implements UseCase<PostEntity, int> {
  final PostsRepository repository;
  GetPostByIdUseCase({required this.repository});

  @override
  Future<Either<Failure,PostEntity>> call(int id) {

    return repository.getPost(id);
  }
}
