import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/banners_entity.dart';
import '../entities/categories_entity.dart';
import '../entities/places_entity.dart';
import '../usecase/get_places_usecase.dart';



abstract class HomeRepository{

    Future<Either<Failure,BannersEntity>> getBanners();
    Future<Either<Failure,CategoriesEntity>> getCategories();
    Future<Either<Failure,PlacesEntity>> getPlaces(GetPlacesParams params);


}