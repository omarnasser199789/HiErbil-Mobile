import 'dart:convert';
import 'package:hi_erbil_mobile/features/home/data/models/banners_model.dart';
import 'package:hi_erbil_mobile/features/home/data/models/place_model.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/globals.dart';
import '../../../domain/entities/banners_entity.dart';
import '../../../domain/usecase/get_places_usecase.dart';
import '../../models/categories_model.dart';
import '../../models/places_model.dart';
import '../../models/tags_model.dart';
import 'home_remote_data_functions.dart';

abstract class HomeRemoteDataSource {


  Future<BannersModel> getBanners();
  Future<CategoriesModel> getCategories();
  Future<PlacesModel> getPlaces(GetPlacesParams params);
  Future<TagsModel> getTags(int? catId);
  Future<PlaceModel> getPlaceById(int id);



}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;
  // final SharedPreferences sharedPreferences;

  HomeRemoteDataSourceImpl({required this.client
    // ,required this.sharedPreferences
  });

  HomeRemoteDataFunctions functions =
  HomeRemoteDataFunctions();


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





}
