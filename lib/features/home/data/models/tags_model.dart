// To parse this JSON data, do
//
//     final tagsModel = tagsModelFromJson(jsonString);

import 'dart:convert';

import '../../../../core/classes/attachment.dart';
import '../../domain/entities/tags_entity.dart';

TagsModel tagsModelFromJson(String str) => TagsModel.fromJson(json.decode(str));

String tagsModelToJson(TagsModel data) => json.encode(data.toJson());

class TagsModel extends TagsEntity{
  TagsModel({
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

  factory TagsModel.fromJson(Map<String, dynamic> json) => TagsModel(
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
