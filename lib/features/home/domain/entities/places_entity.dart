import 'package:equatable/equatable.dart';

import '../../data/models/places_model.dart';

class PlacesEntity extends Equatable{
  PlacesEntity({
    required this.data,
    required this.count,
    required this.pages,
  });

  List<Datum> data;
  int count;
  int pages;
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}