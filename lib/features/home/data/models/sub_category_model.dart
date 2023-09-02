import 'dart:convert';

import '../../domain/entities/get_sub_category_entity.dart';

List<SubCategoryModel> subCategoryModelFromJson(String str) => List<SubCategoryModel>.from(json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

String subCategoryModelToJson(List<SubCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryModel extends SubCategoryEntity{

  int id;
  String title;
  String iconUrl;
  int categoryId;

  SubCategoryModel({
    required this.id,
    required this.title,
    required this.iconUrl,
    required this.categoryId,
  }):super(
    id: id,
    title: title,
    iconUrl:iconUrl,
    categoryId:categoryId,
  );

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    id: json["id"],
    title: json["title"],
    iconUrl: json["icon_url"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "icon_url": iconUrl,
    "categoryId": categoryId,
  };

}
