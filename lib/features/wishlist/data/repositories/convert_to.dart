
import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/wishlist/domain/entities/wishlist_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';





typedef Future<int> IntInfoChooser();
typedef Future<List<WishlistEntity>> WishlistEntityInfoChooser();



Future<Either<Failure,int>> convertToInt(
    IntInfoChooser vv,
    ) async{
  try {
    final remotePhysician = await vv();
    return Right(remotePhysician);
  } on ServerException {
    return Left(ServerFailure());
  }
}
Future<Either<Failure,List<WishlistEntity>>> convertToWishlistEntity(
    WishlistEntityInfoChooser vv,
    ) async{
  try {
    final remotePhysician = await vv();
    return Right(remotePhysician);
  } on ServerException {
    return Left(ServerFailure());
  }
}
