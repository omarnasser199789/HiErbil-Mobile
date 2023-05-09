import 'dart:convert';
import 'package:hi_erbil_mobile/features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/globals.dart';
import '../../../domain/entities/blog_categories_entity.dart';
import '../../models/blog_categories_model.dart';
import 'posts_remote_data_functions.dart';

abstract class PostRemoteDataSource {


  Future<BlogCategoriesModel> getBlogCategories();
  Future<PostModel> getPost(int id);





}

class PostsRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;
  // final SharedPreferences sharedPreferences;

  PostsRemoteDataSourceImpl({required this.client
    // ,required this.sharedPreferences
  });

  PostsRemoteDataFunctions functions =
  PostsRemoteDataFunctions();

  
  @override
  Future<BlogCategoriesModel> getBlogCategories() {

    return functions.getBanners('$baseUrl/BlogCategory?pageSize=10&page=0');
  }

  @override
  Future<PostModel> getPost(int id) {
    return functions.getPost('$baseUrl/Post/$id');
  }





}
