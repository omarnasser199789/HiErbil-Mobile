// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

import '../../../../core/classes/attachment.dart';
import '../../domain/entities/product_entity.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel extends ProductEntity {
  int id;
  String titleEn;
  String titleAr;
  String titleKu;
  String descriptionEn;
  String descriptionAr;
  String descriptionKu;
  bool deleted;
  DateTime createdAt;
  int createdBy;
  int subCategoryId;
  List<Attachment> attachments;

  ProductModel({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.titleKu,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.descriptionKu,
    required this.deleted,
    required this.createdAt,
    required this.createdBy,
    required this.subCategoryId,
    required this.attachments,
  }):super(
    id:id,
    titleEn:titleEn,
    titleAr:titleAr,
    titleKu:titleKu,
    descriptionEn:descriptionEn,
    descriptionAr:descriptionAr,
    descriptionKu:descriptionKu,
    deleted:deleted,
    createdAt:createdAt,
    createdBy:createdBy,
    subCategoryId:subCategoryId,
    attachments:attachments,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    titleEn: json["title_en"],
    titleAr: json["title_ar"],
    titleKu: json["title_ku"],
    descriptionEn: json["description_en"],
    descriptionAr: json["description_ar"],
    descriptionKu: json["description_ku"],
    deleted: json["deleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    createdBy: json["createdBy"],
    subCategoryId: json["subCategoryId"],
    attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_en": titleEn,
    "title_ar": titleAr,
    "title_ku": titleKu,
    "description_en": descriptionEn,
    "description_ar": descriptionAr,
    "description_ku": descriptionKu,
    "deleted": deleted,
    "createdAt": createdAt.toIso8601String(),
    "createdBy": createdBy,
    "subCategoryId": subCategoryId,
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
  };
}

