
import 'package:equatable/equatable.dart';

import '../../data/models/categories_model.dart';

class CategoriesEntity extends Equatable{
  CategoriesEntity({
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