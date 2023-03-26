
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/blog_categories_entity.dart';
import '../repositories/posts_repository.dart';


class GetBlogCategoriesUseCase implements UseCase<BlogCategoriesEntity, String> {
  final PostsRepository repository;
  GetBlogCategoriesUseCase({required this.repository});

  @override
  Future<Either<Failure,BlogCategoriesEntity>> call(String noParams) {

    return repository.getBlogCategories();
  }
}
