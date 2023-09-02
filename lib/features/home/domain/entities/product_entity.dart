import 'package:hi_erbil_mobile/features/home/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/classes/attachment.dart';
class ProductEntity extends Equatable{
  int id;
  String titleEn;
  String titleAr;
  String titleKu;
  String descriptionEn;
  String descriptionAr;
  String descriptionKu;
  bool deleted;
  DateTime createdAt;
  int createdBy;
  int subCategoryId;
  List<Attachment> attachments;

  ProductEntity({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.titleKu,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.descriptionKu,
    required this.deleted,
    required this.createdAt,
    required this.createdBy,
    required this.subCategoryId,
    required this.attachments,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}