import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable{

  int id;
  String title;
  String iconUrl;
  int categoryId;

  SubCategoryEntity({
    required this.id,
    required this.title,
    required this.iconUrl,
    required this.categoryId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}