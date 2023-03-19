
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/banners_entity.dart';
import '../../domain/entities/categories_entity.dart';
import '../../domain/entities/places_entity.dart';





typedef Future<BannersEntity> BannersEntityInfoChooser();
typedef Future<CategoriesEntity> CategoriesEntityInfoChooser();
typedef Future<PlacesEntity> PlacesEntityInfoChooser();



Future<Either<Failure,BannersEntity>> convertToBannersEntity(
    BannersEntityInfoChooser vv,
    ) async{
  try {
    final remotePhysician = await vv();
    return Right(remotePhysician);
  } on ServerException {
    return Left(ServerFailure());
  }
}

Future<Either<Failure,CategoriesEntity>> convertToCategoriesEntity(
    CategoriesEntityInfoChooser vv,
    ) async{
  try {
    final remotePhysician = await vv();
    return Right(remotePhysician);
  } on ServerException {
    return Left(ServerFailure());
  }
}

Future<Either<Failure,PlacesEntity>> convertToPlacesEntity(
    PlacesEntityInfoChooser vv,
    ) async{
  try {
    final remotePhysician = await vv();
    return Right(remotePhysician);
  } on ServerException {
    return Left(ServerFailure());
  }
}
