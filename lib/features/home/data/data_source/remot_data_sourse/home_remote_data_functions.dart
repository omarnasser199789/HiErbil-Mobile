import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hi_erbil_mobile/features/home/data/models/place_model.dart';
import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/globals.dart';
import '../../models/banners_model.dart';
import '../../models/categories_model.dart';
import '../../models/map_items_model.dart';
import '../../models/places_model.dart';
import '../../models/product_model.dart';
import '../../models/products_list_model.dart';
import '../../models/sub_category_model.dart';
import '../../models/tags_model.dart';

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

  Future<TagsModel> getTags(String url,) async {
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
        return tagsModelFromJson(response.body);
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



  Future<PlaceModel> getPlaceById(String url,) async {
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
        return placeModelFromJson(response.body);
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

  Future<MapItemsModel> getMapItems (String url) async {
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
        return mapItemsModelFromJson(response.body);
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

  Future<List<SubCategoryModel>> getSubCategory (String url) async {
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
        return subCategoryModelFromJson(response.body);
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

  Future<List<ProductModel>> getProductBySubCatId (String url) async {
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
        return productModelFromJson(response.body);
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

  Future<ProductListModel> getAllProducts (String url) async {
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
        return productListModelFromJson(response.body);
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

  Future<ProductModel> getProductById (String url) async {
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
        return ProductModel.fromJson(json.decode(response.body));
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
