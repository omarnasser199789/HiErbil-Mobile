import 'package:equatable/equatable.dart';

import '../../data/models/blog_categories_model.dart';
class BlogCategoriesEntity extends Equatable{
  BlogCategoriesEntity({
    required this.data,
    required this.count,
    required this.pages,
  });

  List<Datum> data;
  int count;
  int pages;

  @override
  // TODO: implement props
  List<Object?> get props => [data,count,pages];
}