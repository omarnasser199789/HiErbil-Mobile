// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

import '../../../../core/classes/attachment.dart';
import '../../domain/entities/post_entity.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel extends PostEntity {
  PostModel({
    required this.id,
    required this.blogCategoryId,
    required this.createdAt,
    required this.createdByUser,
    required this.blogCategory,
    required this.attachments,
    required this.title,
    required this.description,
  }):super(
    id:id,
    blogCategoryId:blogCategoryId,
    createdAt:createdAt,
    createdByUser:createdByUser,
    blogCategory:blogCategory,
    attachments:attachments,
    title:title,
    description:description,
  );

  int id;
  int blogCategoryId;
  DateTime createdAt;
  CreatedByUser createdByUser;
  BlogCategory blogCategory;
  List<Attachment> attachments;
  String title;
  String description;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    blogCategoryId: json["blogCategoryId"],
    createdAt: DateTime.parse(json["createdAt"]),
    createdByUser: CreatedByUser.fromJson(json["createdByUser"]),
    blogCategory: BlogCategory.fromJson(json["blogCategory"]),
    attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "blogCategoryId": blogCategoryId,
    "createdAt": createdAt.toIso8601String(),
    "createdByUser": createdByUser.toJson(),
    "blogCategory": blogCategory.toJson(),
    "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    "title": title,
    "description": description,
  };
}

class CreatedByUser {
  CreatedByUser({
    required this.username,
  });

  String username;

  factory CreatedByUser.fromJson(Map<String, dynamic> json) => CreatedByUser(
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
  };
}

class BlogCategory {
  BlogCategory({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory BlogCategory.fromJson(Map<String, dynamic> json) => BlogCategory(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
