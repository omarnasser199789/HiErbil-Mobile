import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/banners_entity.dart';
import '../entities/categories_entity.dart';
import '../entities/place_entity.dart';
import '../entities/places_entity.dart';
import '../entities/tags_entity.dart';
import '../usecase/get_places_usecase.dart';



abstract class HomeRepository{

    Future<Either<Failure,BannersEntity>> getBanners();
    Future<Either<Failure,CategoriesEntity>> getCategories();
    Future<Either<Failure,PlacesEntity>> getPlaces(GetPlacesParams params);
    Future<Either<Failure,TagsEntity>> getTags(int ?catId);
    Future<Either<Failure,PlaceEntity>> getPlaceById(int id);


}