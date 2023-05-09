import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/blog_categories_entity.dart';
import '../entities/post_entity.dart';




abstract class PostsRepository{

    Future<Either<Failure,BlogCategoriesEntity>> getBlogCategories();
    Future<Either<Failure,PostEntity>> getPost(int id);
}