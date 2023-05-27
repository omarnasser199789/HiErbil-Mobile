import 'package:equatable/equatable.dart';
import '../../data/models/map_items_model.dart';

class MapItemsEntity extends  Equatable {

  List<Datum> data;
  int count;
  int pages;

  MapItemsEntity({
    required this.data,
    required this.count,
    required this.pages,
  });


  @override
  // TODO: implement props
  List<Object?> get props => [data,count,pages];

}