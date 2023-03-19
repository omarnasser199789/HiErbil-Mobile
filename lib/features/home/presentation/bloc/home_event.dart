
import '../../domain/usecase/get_places_usecase.dart';

abstract class HomeEvent {}







class GetBannersEvent extends HomeEvent {}
class GetCategoriesEvent extends HomeEvent {}
class GetPlacesEvent extends HomeEvent {
  GetPlacesEvent({required this.params});
  GetPlacesParams  params;
}

