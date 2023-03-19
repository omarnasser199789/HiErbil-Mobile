
import 'package:equatable/equatable.dart';

import '../../data/models/banners_model.dart';

class BannersEntity extends Equatable{

  BannersEntity({
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