import 'dart:convert';

import 'package:hi_erbil_mobile/features/home/data/models/product_model.dart';

import '../../domain/entities/products_list_entity.dart';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel extends ProductListEntity{
  List<ProductModel> data;
  int count;
  int pages;

  ProductListModel({
    required this.data,
    required this.count,
    required this.pages,
  }):super(
    data:data,
    count:count,
    pages:pages,
  );

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
    data: List<ProductModel>.from(json["data"].map((x) => ProductModel.fromJson(x))),
    count: json["count"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "count": count,
    "pages": pages,
  };
}


