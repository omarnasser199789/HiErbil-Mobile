import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hi_erbil_mobile/features/posts/data/models/post_model.dart';
import 'package:http/http.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/globals.dart';
import '../../models/blog_categories_model.dart';

class PostsRemoteDataFunctions {
  Future<BlogCategoriesModel> getBanners(String url,) async {
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
        return blogCategoriesModelFromJson(response.body);
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
  Future<PostModel> getPost(String url,) async {
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
        return postModelFromJson(response.body);
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
