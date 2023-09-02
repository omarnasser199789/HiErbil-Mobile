import 'dart:convert';

import '../../../../core/classes/attachment.dart';
import '../../domain/entities/map_items_entity.dart';

MapItemsModel mapItemsModelFromJson(String str) => MapItemsModel.fromJson(json.decode(str));

String mapItemsModelToJson(MapItemsModel data) => json.encode(data.toJson());

class MapItemsModel extends MapItemsEntity {
  List<Datum> data;
  int count;
  int pages;

  MapItemsModel({
    required this.data,
    required this.count,
    required this.pages,
  }):super(
    data:data,
    count:count,
    pages:pages,
  );

  factory MapItemsModel.fromJson(Map<String, dynamic> json) => MapItemsModel(
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
  int id;
  String iconUrl;
  List<Tag> tags;
  List<Attachment> attachments;
  String title;

  Datum({
    required this.id,
    required this.iconUrl,
    required this.tags,
    required this.attachments,
    required this.title,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    iconUrl: json["icon_url"]!,
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon_url": iconUrl,
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    "title": title,
  };
}



class Tag {
  int id;
  List<TagPlace> tagPlaces;
  String title;

  Tag({
    required this.id,
    required this.tagPlaces,
    required this.title,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    tagPlaces: List<TagPlace>.from(json["tagPlaces"].map((x) => TagPlace.fromJson(x))),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tagPlaces": List<dynamic>.from(tagPlaces.map((x) => x.toJson())),
    "title": title,
  };
}

class TagPlace {
  Place place;

  TagPlace({
    required this.place,
  });

  factory TagPlace.fromJson(Map<String, dynamic> json) => TagPlace(
    place: Place.fromJson(json["place"]),
  );

  Map<String, dynamic> toJson() => {
    "place": place.toJson(),
  };
}

class Place {
  int id;
  double lat;
  double long;
  bool isMain;
  String type;
  String description;
  String title;
  String address;

  Place({
    required this.id,
    required this.lat,
    required this.long,
    required this.isMain,
    required this.type,
    required this.description,
    required this.title,
    required this.address,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    id: json["id"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    isMain: json["isMain"],
    type: json["type"],
    description: json["description"],
    title: json["title"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lat": lat,
    "long": long,
    "isMain": isMain,
    "type": type,
    "description": description,
    "title": title,
    "address": address,
  };
}
