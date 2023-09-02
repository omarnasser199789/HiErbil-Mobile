import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/banners_entity.dart';
import '../entities/categories_entity.dart';
import '../entities/get_sub_category_entity.dart';
import '../entities/map_items_entity.dart';
import '../entities/place_entity.dart';
import '../entities/places_entity.dart';
import '../entities/product_entity.dart';
import '../entities/products_list_entity.dart';
import '../entities/tags_entity.dart';
import '../usecase/get_places_usecase.dart';

abstract class HomeRepository{

    Future<Either<Failure,BannersEntity>> getBanners();
    Future<Either<Failure,CategoriesEntity>> getCategories();
    Future<Either<Failure,List<SubCategoryEntity>>> getSubCategory(int id);
    Future<Either<Failure,PlacesEntity>> getPlaces(GetPlacesParams params);
    Future<Either<Failure,TagsEntity>> getTags(int ?catId);
    Future<Either<Failure,PlaceEntity>> getPlaceById(int id);
    Future<Either<Failure,MapItemsEntity>> getMapItems();
    Future<Either<Failure,List<ProductEntity>>> getProductBySubCatId(int id);
    Future<Either<Failure,List<ProductEntity>>> getNewestProducts();
    Future<Either<Failure,ProductListEntity>> getAllProducts();
    Future<Either<Failure,ProductEntity>> getProductById(int id);

}