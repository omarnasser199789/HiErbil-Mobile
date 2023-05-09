
import '../../domain/usecase/get_places_usecase.dart';

abstract class HomeEvent {}







class GetBannersEvent extends HomeEvent {}
class GetCategoriesEvent extends HomeEvent {}
class GetPlaceEvent extends HomeEvent {
  int id;
  GetPlaceEvent({required this.id});
}
class GetTagsEvent extends HomeEvent {
  int ? catId;
  GetTagsEvent({required this.catId});
}
class GetPlacesEvent extends HomeEvent {
  GetPlacesEvent({required this.params});
  GetPlacesParams  params;
}

