// To parse this JSON data, do
//
//     final PlacesModel = PlacesModelFromJson(jsonString);

import 'dart:convert';

import 'package:hi_erbil_mobile/features/home/domain/entities/places_entity.dart';

import '../../../../core/classes/attachment.dart';

PlacesModel PlacesModelFromJson(String str) => PlacesModel.fromJson(json.decode(str));

String PlacesModelToJson(PlacesModel data) => json.encode(data.toJson());

class PlacesModel extends PlacesEntity {
  PlacesModel({
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

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
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
    required this.lat,
    required this.long,
    required this.isMain,
    required this.type,
    required this.createdAt,
    required this.attachments,
    required this.title,
    required this.address,
    required this.description,
  });

  int id;
  double lat;
  double long;
  bool isMain;
  String type;
  DateTime createdAt;
  List<Attachment> attachments;
  String title;
  String address;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    lat: json["lat"],
    long: json["long"],
    isMain: json["isMain"],
    type: json["type"],
    createdAt: DateTime.parse(json["createdAt"]),
    attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
    title: json["title"],
    address: json["address"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lat": lat,
    "long": long,
    "isMain": isMain,
    "type": type,
    "createdAt": createdAt.toIso8601String(),
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    "title": title,
    "address": address,
    "description": description,
  };
}

