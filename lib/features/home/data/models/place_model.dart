// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'dart:convert';

import 'package:hi_erbil_mobile/features/home/domain/entities/place_entity.dart';

import '../../../../core/classes/attachment.dart';

PlaceModel placeModelFromJson(String str) => PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

class PlaceModel extends PlaceEntity {
  PlaceModel({
    required this.id,
    required this.lat,
    required this.long,
    required this.isMain,
    required this.type,
    required this.createdAt,
    required this.tagPlaces,
    required this.attachments,
    required this.title,
    required this.address,
    required this.description,
  }):super(
    id:id,
    lat:lat,
    long:long,
    isMain:isMain,
    type:type,
    createdAt:createdAt,
    tagPlaces:tagPlaces,
    attachments:attachments,
    title:title,
    address:address,
    description:description,
  );

  int id;
  double lat;
  double long;
  bool isMain;
  String type;
  DateTime createdAt;
  List<TagPlace> tagPlaces;
  List<Attachment> attachments;
  String title;
  String address;
  String description;

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
    id: json["id"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    isMain: json["isMain"],
    type: json["type"],
    createdAt: DateTime.parse(json["createdAt"]),
    tagPlaces: List<TagPlace>.from(json["tagPlaces"].map((x) => TagPlace.fromJson(x))),
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
    "tagPlaces": List<dynamic>.from(tagPlaces.map((x) => x.toJson())),
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    "title": title,
    "address": address,
    "description": description,
  };
}



class TagPlace {
  TagPlace({
    required this.id,
    required this.placeId,
    required this.tagId,
    required this.tag,
  });

  int id;
  int placeId;
  int tagId;
  Tag tag;

  factory TagPlace.fromJson(Map<String, dynamic> json) => TagPlace(
    id: json["id"],
    placeId: json["placeId"],
    tagId: json["tagId"],
    tag: Tag.fromJson(json["tag"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "placeId": placeId,
    "tagId": tagId,
    "tag": tag.toJson(),
  };
}

class Tag {
  Tag({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    title: json["title"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title
  };
}
