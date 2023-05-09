import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/posts/domain/entities/post_entity.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/blog_categories_entity.dart';
import '../../domain/repositories/posts_repository.dart';
import '../data_source/remot_data_sourse/posts_remot_data_source.dart';
import 'convert_to.dart';






class PostsRepositoryImpl implements PostsRepository{

  final PostRemoteDataSource postsRemoteDataSource;


  PostsRepositoryImpl({

   required  this.postsRemoteDataSource,
});


  @override
  Future<Either<Failure,BlogCategoriesEntity>> getBlogCategories() async {
    return await convertToBlogCategoriesEntity((){
      return postsRemoteDataSource.getBlogCategories();
    });

  }

  @override
  Future<Either<Failure, PostEntity>> getPost(int id) async {
    return await convertToPostEntity((){
      return postsRemoteDataSource.getPost(id);
    });
  }


}