
import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/posts/domain/entities/post_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/blog_categories_entity.dart';






typedef Future<BlogCategoriesEntity> BlogCategoriesEntityInfoChooser();
typedef Future<PostEntity> PostEntityInfoChooser();




Future<Either<Failure,BlogCategoriesEntity>> convertToBlogCategoriesEntity(
    BlogCategoriesEntityInfoChooser vv,
    ) async{
  try {
    final remotePhysician = await vv();
    return Right(remotePhysician);
  } on ServerException {
    return Left(ServerFailure());
  }
}

Future<Either<Failure,PostEntity>> convertToPostEntity(
    PostEntityInfoChooser vv,
    ) async{
  try {
    final remotePhysician = await vv();
    return Right(remotePhysician);
  } on ServerException {
    return Left(ServerFailure());
  }
}
