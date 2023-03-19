// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

import '../../../../core/classes/attachment.dart';
import '../../domain/entities/categories_entity.dart';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel  extends CategoriesEntity{
  CategoriesModel({
    required this.data,
    required this.count,
    required this.pages,
  }):super(
    data:data,
    count:count,
    pages:pages,
  );

  List<Datum> data;
  int count;
  int pages;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    count: json["count"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "count": count,
    "pages": pages,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.attachments,
    required this.title,
  });

  int id;
  List<Attachment> attachments;
  String title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    "title": title,
  };
}


