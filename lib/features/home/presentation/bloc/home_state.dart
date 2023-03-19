



import 'package:hi_erbil_mobile/features/home/domain/entities/places_entity.dart';

import '../../domain/entities/banners_entity.dart';
import '../../domain/entities/categories_entity.dart';

abstract class HomeState {}

class PatientsInitial extends HomeState {}

class Loading extends HomeState {}

class SuccessGetBanners extends HomeState {
  BannersEntity bannersEntity;
  SuccessGetBanners({required this.bannersEntity});
}
class SuccessGetCategories extends HomeState {
  CategoriesEntity categoriesEntity;
  SuccessGetCategories({required this.categoriesEntity});
}
class SuccessGetPlaces extends HomeState {
  PlacesEntity placesEntity;
  SuccessGetPlaces({required this.placesEntity});
}




class Error extends  HomeState {
  final String message;

  Error({ required this.message}); //we use this constructor in ((BLOC & test))

  @override
  List<Object> get props => [message];
}

class Empty extends  HomeState {}
