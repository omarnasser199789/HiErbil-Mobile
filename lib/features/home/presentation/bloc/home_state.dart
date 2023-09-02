



import 'package:hi_erbil_mobile/features/home/domain/entities/place_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/places_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/tags_entity.dart';

import '../../domain/entities/banners_entity.dart';
import '../../domain/entities/categories_entity.dart';
import '../../domain/entities/get_sub_category_entity.dart';
import '../../domain/entities/map_items_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/products_list_entity.dart';

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

class SuccessGetTags extends HomeState {
  TagsEntity tagsEntity;
  SuccessGetTags({required this.tagsEntity});
}

class SuccessGetPlace extends HomeState {
  PlaceEntity placeEntity;
  SuccessGetPlace({required this.placeEntity});
}

class SuccessGetMapItems extends HomeState {
  MapItemsEntity mapItemsEntity;
  SuccessGetMapItems({required this.mapItemsEntity});
}

class SuccessGetSubCategoryEntity extends HomeState {
  List<SubCategoryEntity> list;
  SuccessGetSubCategoryEntity({required this.list});
}
class SuccessGetProductsBySubCatIdEntity extends HomeState {
  List<ProductEntity> list;
  SuccessGetProductsBySubCatIdEntity({required this.list});
}
class SuccessGetNewestProductsEntity extends HomeState {
  List<ProductEntity> list;
  SuccessGetNewestProductsEntity({required this.list});
}
class SuccessGetAllProductsEntity extends HomeState {
  ProductListEntity productListEntity;
  SuccessGetAllProductsEntity({required this.productListEntity});
}

class SuccessGetProductsByIdEntity extends HomeState {
  ProductEntity productEntity;
  SuccessGetProductsByIdEntity({required this.productEntity});
}

class Error extends  HomeState {
  final String message;

  Error({ required this.message}); //we use this constructor in ((BLOC & test))

  @override
  List<Object> get props => [message];
}

class Empty extends  HomeState {}
