import 'package:equatable/equatable.dart';

class WishlistEntity extends Equatable{

  WishlistEntity({
    required this.id,
    required this.apiId,
    required this.title,
    required this.image,
  });

  int id;
  int apiId;
  String title;
  String image;
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}