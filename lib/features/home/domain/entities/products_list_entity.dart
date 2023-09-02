import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';
class ProductListEntity extends Equatable{
  List<ProductModel> data;
  int count;
  int pages;

  ProductListEntity({
    required this.data,
    required this.count,
    required this.pages,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}