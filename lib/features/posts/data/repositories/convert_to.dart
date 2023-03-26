
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/blog_categories_entity.dart';






typedef Future<BlogCategoriesEntity> BlogCategoriesEntityInfoChooser();




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
