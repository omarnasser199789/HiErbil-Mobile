import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/categories_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/places_entity.dart';


import '../../../../core/error/failures.dart';
import '../../domain/entities/banners_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecase/get_places_usecase.dart';
import '../data_source/remot_data_sourse/home_remot_data_source.dart';
import 'convert_to.dart';






class HomeRepositoryImpl implements HomeRepository{

  final HomeRemoteDataSource homeRemoteDataSource;


  HomeRepositoryImpl({

   required  this.homeRemoteDataSource,
});


  @override
  Future<Either<Failure,BannersEntity>> getBanners() async {
    return await convertToBannersEntity((){
      return homeRemoteDataSource.getBanners();
    });

  }

  @override
  Future<Either<Failure, CategoriesEntity>> getCategories()async {
    return await convertToCategoriesEntity((){
      return homeRemoteDataSource.getCategories();
    });
  }

  @override
  Future<Either<Failure, PlacesEntity>> getPlaces(GetPlacesParams params)async {
    return await convertToPlacesEntity((){
      return homeRemoteDataSource.getPlaces(params);
    });
  }



}