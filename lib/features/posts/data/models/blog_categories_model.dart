// To parse this JSON data, do
//
//     final blogCategoriesModel = blogCategoriesModelFromJson(jsonString);

import 'dart:convert';

import '../../../../core/classes/attachment.dart';
import '../../domain/entities/blog_categories_entity.dart';

BlogCategoriesModel blogCategoriesModelFromJson(String str) => BlogCategoriesModel.fromJson(json.decode(str));

String blogCategoriesModelToJson(BlogCategoriesModel data) => json.encode(data.toJson());

class BlogCategoriesModel extends BlogCategoriesEntity {
  BlogCategoriesModel({
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

  factory BlogCategoriesModel.fromJson(Map<String, dynamic> json) => BlogCategoriesModel(
    data: (json["data"]!=null)?List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))):[],
    count: json["count"]??-1,
    pages: json["pages"]??-1,
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
    required this.posts,
    required this.attachments,
    required this.title,
  });

  int id;
  List<Post> posts;
  List<Attachment> attachments;
  String title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"]??-1,
    posts: (json["posts"]!=null)?List<Post>.from(json["posts"].map((x) => Post.fromJson(x))):[],
    attachments: (json["attachments"]!=null)?List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))):[],
    title: json["title"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    "title": title,
  };
}



class Post {
  Post({
    required this.id,
    required this.createdAt,
    required this.createdByUser,
    required this.title,
    required this.description,
    required this.attachments,
  });

  int id;
  DateTime createdAt;
  CreatedByUser createdByUser;
  String title;
  String description;
  List<Attachment> attachments;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"]??-1,
    createdAt:(json["createdAt"]!=null)? DateTime.parse(json["createdAt"]):DateTime.now(),
    createdByUser:(json["createdByUser"]!=null)? CreatedByUser.fromJson(json["createdByUser"]):CreatedByUser(username: '', id: -1),
    title: json["title"]??"",
    description: json["description"]??"",
    attachments: (json["attachments"]!=null)?List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "title": title,
    "description": description,
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
  };
}
class CreatedByUser {
  CreatedByUser({
    required this.username,
    required this.id,
  });

  String username;
  int id;

  factory CreatedByUser.fromJson(Map<String, dynamic> json) => CreatedByUser(
    username: json["username"]??"",
    id: json["id"]??-1,
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "id": id,
  };
}
