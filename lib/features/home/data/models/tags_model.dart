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
    required this.tagPlaces,
    required this.attachments,
    required this.title,
  });

  int id;
  List<TagPlace> tagPlaces;
  List<Attachment> attachments;
  String title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]??-1,
    tagPlaces:(json["tagPlaces"]!=null)? List<TagPlace>.from(json["tagPlaces"].map((x) => TagPlace.fromJson(x))):[],
    attachments:(json["attachments"]!=null)? List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))):[],
    title: json["title"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tagPlaces": List<dynamic>.from(tagPlaces.map((x) => x.toJson())),
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    "title": title,
  };
}

class TagPlace {
  TagPlace({
    required this.place,
  });

  Place place;

  factory TagPlace.fromJson(Map<String, dynamic> json) => TagPlace(
    place: Place.fromJson(json["place"]),
  );

  Map<String, dynamic> toJson() => {
    "place": place.toJson(),
  };
}


class Place {
  Place({
    required this.id,
    required this.lat,
    required this.long,
    required this.isMain,
    required this.type,
    required this.title,
    required this.description,
    required this.address,
    required this.attachments,
  });

  int id;
  double lat;
  double long;
  bool isMain;
  String type;
  String title;
  String description;
  String address;
  List<Attachment> attachments;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    id: json["id"]??-1,
    lat: json["lat"]/1??0.0,
    long: json["long"]/1??0.0,
    isMain: json["isMain"]??false,
    type: json["type"]??"",
    title: json["title"]??"",
    description: json["description"]??"",
    address: json["address"]??"",
    attachments:(json["attachments"]!=null)? List<Attachment>.from(json["attachments"].map((x) => x)):[],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lat": lat,
    "long": long,
    "isMain": isMain,
    "type": type,
    "title": title,
    "description": description,
    "address": address,
    "attachments": List<dynamic>.from(attachments.map((x) => x)),
  };
}