import 'package:equatable/equatable.dart';

import '../../data/models/tags_model.dart';
class TagsEntity extends Equatable{
  List<Datum> data;
  int count;
  int pages;
  TagsEntity({
    required this.data,
    required this.count,
    required this.pages,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [data,count,pages];
}