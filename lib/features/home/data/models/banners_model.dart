// To parse this JSON data, do
//
//     final bannersModel = bannersModelFromJson(jsonString);

import 'dart:convert';

import '../../../../core/classes/attachment.dart';
import '../../domain/entities/banners_entity.dart';

BannersModel bannersModelFromJson(String str) => BannersModel.fromJson(json.decode(str));

String bannersModelToJson(BannersModel data) => json.encode(data.toJson());

class BannersModel  extends BannersEntity{
  BannersModel({
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

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
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
    required this.link,
    required this.deleted,
    required this.createdAt,
    required this.createdBy,
    required this.attachments,
  });

  int id;
  String link;
  bool deleted;
  DateTime createdAt;
  int createdBy;
  List<Attachment> attachments;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]?? -1,
    link: json["link"]??"",
    deleted: json["deleted"]??false,
    createdAt:(json["createdAt"]!=null)? DateTime.parse(json["createdAt"]):DateTime.now(),
    createdBy: json["createdBy"]??-1,
    attachments:(json["attachments"]!=null)? List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "link": link,
    "deleted": deleted,
    "createdAt": createdAt.toIso8601String(),
    "createdBy": createdBy,
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
  };
}


