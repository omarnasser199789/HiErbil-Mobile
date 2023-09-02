import 'dart:convert';
import 'package:hi_erbil_mobile/features/home/data/models/banners_model.dart';
import 'package:hi_erbil_mobile/features/home/data/models/place_model.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/globals.dart';
import '../../../domain/entities/banners_entity.dart';
import '../../../domain/usecase/get_places_usecase.dart';
import '../../models/categories_model.dart';
import '../../models/map_items_model.dart';
import '../../models/places_model.dart';
import '../../models/product_model.dart';
import '../../models/products_list_model.dart';
import '../../models/sub_category_model.dart';
import '../../models/tags_model.dart';
import 'home_remote_data_functions.dart';

abstract class HomeRemoteDataSource {

  Future<BannersModel> getBanners();
  Future<CategoriesModel> getCategories();
  Future<PlacesModel> getPlaces(GetPlacesParams params);
  Future<TagsModel> getTags(int? catId);
  Future<PlaceModel> getPlaceById(int id);
  Future<MapItemsModel> getMapItems();
  Future<List<SubCategoryModel>> getSubCategory(int id);
  Future<List<ProductModel>> getProductBySubCatId(int id);
  Future<List<ProductModel>> getNewestProducts();
  Future<ProductListModel> getAllProducts();
  Future<ProductModel> getProductById(int id);

}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  HomeRemoteDataFunctions functions = HomeRemoteDataFunctions();


  @override
  Future<BannersModel> getBanners() async {

      return functions.getReadProducts('$baseUrl/Banner?pageSize=100&page=0');


  }

  @override
  Future<CategoriesModel> getCategories() {
    return functions.getCategories('$baseUrl/Category?pageSize=1000&page=0');
  }

  @override
  Future<PlacesModel> getPlaces(GetPlacesParams params) {
    if(params.type!=null){
      return functions.getPlaces('$baseUrl/place?pageSize=10&page=0&type=${params.type}');
    }else{//&q=${params.text}
      return functions.getPlaces('$baseUrl/place?pageSize=10&page=0');
    }

  }

  @override
  Future<TagsModel> getTags(int? catId) {
    if(catId==null){
      return functions.getTags('$baseUrl/tag?pageSize=100&page=0');
    }else{
      return functions.getTags('$baseUrl/tag?pageSize=100&page=0&categoryId=$catId');
    }

  }

  @override
  Future<PlaceModel> getPlaceById(int id) {
    return functions.getPlaceById('$baseUrl/place/$id');
  }

  @override
  Future<MapItemsModel> getMapItems() {
    return functions.getMapItems('$baseUrl/getCategoriesForMap?pageSize=10&page=0');
  }

  @override
  Future<List<SubCategoryModel>> getSubCategory(int id) {
    return functions.getSubCategory('$baseUrl/SubCategory/byCategory/$id');
  }

  @override
  Future<List<ProductModel>> getProductBySubCatId(int id) {
    return functions.getProductBySubCatId('$baseUrl/Product/list/$id');
  }

  @override
  Future<ProductModel> getProductById(int id) {
    return functions.getProductById('$baseUrl/Product/$id');
  }

  @override
  Future<List<ProductModel>> getNewestProducts() {
    return functions.getProductBySubCatId('$baseUrl/Product/newProducts');
  }

  @override
  Future<ProductListModel> getAllProducts() {
    return functions.getAllProducts('$baseUrl/Product?pageSize=10&page=0');
  }


}
