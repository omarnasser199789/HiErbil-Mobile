
import '../../domain/usecase/get_places_usecase.dart';

abstract class HomeEvent {}







class GetBannersEvent extends HomeEvent {}
class GetCategoriesEvent extends HomeEvent {}
class GetMapItemsEvent extends HomeEvent {}
class GetNewestProductsEvent extends HomeEvent {}
class GetAllProductsEvent extends HomeEvent {}
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
class GetSubCategoryEvent extends HomeEvent {
  GetSubCategoryEvent({required this.id});
  int  id;
}

class GetProductsBySubCatIdEvent extends HomeEvent {
  GetProductsBySubCatIdEvent({required this.id});
  int  id;
}

class GetProductsByIdEvent extends HomeEvent {
  GetProductsByIdEvent({required this.id});
  int  id;
}


