import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/globals.dart';
import '../../models/banners_model.dart';
import '../../models/categories_model.dart';
import '../../models/places_model.dart';

class HomeRemoteDataFunctions {
  Future<BannersModel> getReadProducts(String url,) async {
    if (kDebugMode) {
      print(url);
    }

    try {
      final response = await get(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "lang": "${globalSH.getString(CACHED_USER_LANGUAGE)}",
          // 'Authorization': 'Bearer ' + globalSH.getString(CACHED_SERVER_TOKEN)!,
        },
      ).timeout(Duration(seconds: timeout));
      if (kDebugMode) {
        print("StatusCode ${response.statusCode}");
      }
      if (response.statusCode == 200) {
        return bannersModelFromJson(response.body);
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }
        throw ServerException();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      throw ServerException();
    }
  }

  Future<CategoriesModel> getCategories(String url,) async {
    if (kDebugMode) {
      print(url);
    }

    try {
      final response = await get(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "lang": "${globalSH.getString(CACHED_USER_LANGUAGE)}",
        },
      ).timeout(Duration(seconds: timeout));
      if (kDebugMode) {
        print("StatusCode ${response.statusCode}");
      }
      if (response.statusCode == 200) {
        return categoriesModelFromJson(response.body);
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }
        throw ServerException();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      throw ServerException();
    }
  }
  Future<PlacesModel> getPlaces(String url,) async {
    if (kDebugMode) {
      print(url);
    }

    try {
      final response = await get(
        Uri.parse(url),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
          "lang": "${globalSH.getString(CACHED_USER_LANGUAGE)}",
        },
      ).timeout(Duration(seconds: timeout));
      if (kDebugMode) {
        print("StatusCode ${response.statusCode}");
      }
      if (response.statusCode == 200) {
        return PlacesModelFromJson(response.body);
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }
        throw ServerException();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      throw ServerException();
    }
  }

}
