import 'package:equatable/equatable.dart';

import '../../../../core/classes/attachment.dart';
import '../../data/models/post_model.dart';

class PostEntity  extends Equatable{

  PostEntity({
    required this.id,
    required this.blogCategoryId,
    required this.createdAt,
    required this.createdByUser,
    required this.blogCategory,
    required this.attachments,
    required this.title,
    required this.description,
  });

  int id;
  int blogCategoryId;
  DateTime createdAt;
  CreatedByUser createdByUser;
  BlogCategory blogCategory;
  List<Attachment> attachments;
  String title;
  String description;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}