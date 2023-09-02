import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/banners_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/categories_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/places_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/products_list_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/tags_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/globals.dart';
import '../../../domain/entities/get_sub_category_entity.dart';
import '../../../domain/entities/map_items_entity.dart';
import '../../../domain/entities/place_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../home_state.dart';

Stream<HomeState> SuccessGetBannersOrErrorState(
  Either<Failure, BannersEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (bannersEntity) => SuccessGetBanners(bannersEntity:bannersEntity),
  );
}

Stream<HomeState> SuccessGetCategoriesOrErrorState(
  Either<Failure, CategoriesEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (categoriesEntity) => SuccessGetCategories(categoriesEntity:categoriesEntity),
  );
}

Stream<HomeState> SuccessGetPlacesOrErrorState(
  Either<Failure, PlacesEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (placesEntity) => SuccessGetPlaces(placesEntity:placesEntity),
  );
}

Stream<HomeState> SuccessGetTagsOrErrorState(
  Either<Failure, TagsEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (tagsEntity) => SuccessGetTags(tagsEntity:tagsEntity),
  );
}

Stream<HomeState> SuccessGetPlaceOrErrorState(
  Either<Failure, PlaceEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (placeEntity) => SuccessGetPlace(placeEntity:placeEntity),
  );
}

Stream<HomeState> SuccessGetMapItemsOrErrorState(Either<Failure, MapItemsEntity> failureOrSuccess) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (placeEntity) => SuccessGetMapItems(mapItemsEntity:placeEntity),
  );
}

Stream<HomeState> SuccessGetSubCategoryOrErrorState(Either<Failure, List<SubCategoryEntity>> failureOrSuccess) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (list) => SuccessGetSubCategoryEntity(list:list),
  );
}
Stream<HomeState> SuccessGetProductsBySubCatIdOrErrorState(Either<Failure, List<ProductEntity>> failureOrSuccess) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (list) => SuccessGetProductsBySubCatIdEntity(list:list),
  );
}
Stream<HomeState> SuccessGetNewestProductsOrErrorState(Either<Failure, List<ProductEntity>> failureOrSuccess) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (list) => SuccessGetNewestProductsEntity(list:list),
  );
}
Stream<HomeState> SuccessGetAllProductsOrErrorState(Either<Failure,ProductListEntity> failureOrSuccess) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (productListEntity) => SuccessGetAllProductsEntity(productListEntity:productListEntity),
  );
}

Stream<HomeState> SuccessGetProductsByIdOrErrorState(Either<Failure, ProductEntity> failureOrSuccess) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (productEntity) => SuccessGetProductsByIdEntity(productEntity:productEntity),
  );
}


