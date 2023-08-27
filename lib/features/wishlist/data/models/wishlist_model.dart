import 'dart:convert';

import '../../domain/entities/wishlist_entity.dart';

List<WishlistModel> wishlistModelFromJson(String str) => List<WishlistModel>.from(json.decode(str).map((x) => WishlistModel.fromJson(x)));

String wishlistModelToJson(List<WishlistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WishlistModel extends WishlistEntity {
  WishlistModel({
    required this.id,
    required this.apiId,
    required this.title,
    required this.image,
  }):super(
    id:id,
    apiId:apiId,
    title:title,
    image:image,
  );

  int id;
  int apiId;
  String title;
  String image;

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
    id: json["id"],
    apiId: json["apiID"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "apiID": apiId,
    "title": title,
    "image": image,
  };
}
