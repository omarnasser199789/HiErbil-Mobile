import 'dart:convert';
import 'package:hi_erbil_mobile/features/home/data/models/banners_model.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/globals.dart';
import '../../../domain/entities/banners_entity.dart';
import '../../../domain/usecase/get_places_usecase.dart';
import '../../models/categories_model.dart';
import '../../models/places_model.dart';
import 'home_remote_data_functions.dart';

abstract class HomeRemoteDataSource {


  Future<BannersModel> getBanners();
  Future<CategoriesModel> getCategories();
  Future<PlacesModel> getPlaces(GetPlacesParams params);



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
    return functions.getCategories('$baseUrl/Category?pageSize=5&page=0');
  }

  @override
  Future<PlacesModel> getPlaces(GetPlacesParams params) {
    if(params.type!=null){
      return functions.getPlaces('$baseUrl/place?pageSize=10&page=0&type=${params.type}');
    }else{
      return functions.getPlaces('$baseUrl/place?pageSize=10&page=0');
    }

  }





}
