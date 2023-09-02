import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/categories_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/get_sub_category_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/place_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/places_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/product_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/tags_entity.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/banners_entity.dart';
import '../../domain/entities/map_items_entity.dart';
import '../../domain/entities/products_list_entity.dart';
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

  @override
  Future<Either<Failure, TagsEntity>> getTags(int? catId) async{
    return await convertToTagsEntity((){
      return homeRemoteDataSource.getTags(catId);
    });
  }

  @override
  Future<Either<Failure, PlaceEntity>> getPlaceById(int id) async{
    return await convertToPlaceEntity((){
      return homeRemoteDataSource.getPlaceById(id);
    });
  }

  @override
  Future<Either<Failure, MapItemsEntity>> getMapItems() async {
    return await convertToMapItemsEntity((){
      return homeRemoteDataSource.getMapItems();
    });
  }

  @override
  Future<Either<Failure, List<SubCategoryEntity>>> getSubCategory(int id) async{
    return await convertToSubCategoryEntity((){
      return homeRemoteDataSource.getSubCategory(id);
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductBySubCatId(int id) async{
    return await convertToProductEntityList((){
      return homeRemoteDataSource.getProductBySubCatId(id);
    });
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async{
    return await convertToProductEntity((){
      return homeRemoteDataSource.getProductById(id);
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getNewestProducts() async{
    return await convertToProductEntityList((){
      return homeRemoteDataSource.getNewestProducts();
    });
  }

  @override
  Future<Either<Failure, ProductListEntity>> getAllProducts() async{
    return await convertToProductListEntity((){
      return homeRemoteDataSource.getAllProducts();
    });
  }



}