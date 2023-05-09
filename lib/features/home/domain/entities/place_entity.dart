import 'package:equatable/equatable.dart';

import '../../../../core/classes/attachment.dart';
import '../../data/models/place_model.dart';

class PlaceEntity extends Equatable{


  PlaceEntity({
    required this.id,
    required this.lat,
    required this.long,
    required this.isMain,
    required this.type,
    required this.createdAt,
    required this.tagPlaces,
    required this.attachments,
    required this.title,
    required this.address,
    required this.description,
  });

  int id;
  double lat;
  double long;
  bool isMain;
  String type;
  DateTime createdAt;
  List<TagPlace> tagPlaces;
  List<Attachment> attachments;
  String title;
  String address;
  String description;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}