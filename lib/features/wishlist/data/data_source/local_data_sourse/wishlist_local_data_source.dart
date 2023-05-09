import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hi_erbil_mobile/features/wishlist/data/models/wishlist_model.dart';
import '../../../../../core/globals.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/usecase/add_to_wishlist_usecase.dart';



abstract class WishlistLocalDataSource {
  Future<int> addProductToFav(AddProductToFavParams params);
  Future<List<WishlistModel>> getWishlist();
  Future<int> isFav(int id);
  Future<int> deleteFromFav(int id);




}

class WishlistLocalDataSourceImpl implements WishlistLocalDataSource {
  @override
  Future<int> addProductToFav(AddProductToFavParams params) async {
    final db = await database;
    await db.insert(
      'wishlist',
      params.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return 200;
  }

  @override
  Future<List<WishlistModel>> getWishlist() async {
    ///Get a reference to the database.
    final db = await database;
    ///Get items
    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM wishlist");

    ///Generate list of diplomas and packages
    List<WishlistModel> list=[];
    ///Put item in diplomas and packages list
    if(maps.isNotEmpty) {
      for (var item in maps) {
        list.add(WishlistModel.fromJson(item));
      }
    }

    return list;
  }

  @override
  Future<int> isFav(int id) async {
    ///Get a reference to the database.
    final db = await database;
    ///Get items
    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM wishlist WHERE apiID='$id'");

    ///Generate list of diplomas and packages
    List<WishlistModel> list=[];
    ///Put item in diplomas and packages list
    if(maps.isNotEmpty) {
      for (var item in maps) {
        list.add(WishlistModel.fromJson(item));
      }
    }
    if(list.isNotEmpty){
      return 200;
    }else{
      return 402;
    }


  }

  @override
  Future<int> deleteFromFav(int id) async{
    final db = await database;
    ///Delete product from table.
    await db.rawQuery("DELETE  FROM wishlist WHERE apiID='$id'");
    // await db.rawQuery("DELETE  FROM favorite");
    return 200;
  }









}
