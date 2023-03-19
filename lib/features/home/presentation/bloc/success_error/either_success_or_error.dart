import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/banners_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/categories_entity.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/places_entity.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/globals.dart';
import '../home_state.dart';

Stream<HomeState> SuccessGetBannersOrErrorState(
  Either<Failure, BannersEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (bannersEntity) => SuccessGetBanners(
        bannersEntity:bannersEntity
    ),
  );
}
Stream<HomeState> SuccessGetCategoriesOrErrorState(
  Either<Failure, CategoriesEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (categoriesEntity) => SuccessGetCategories(
        categoriesEntity:categoriesEntity
    ),
  );
}
Stream<HomeState> SuccessGetPlacesOrErrorState(
  Either<Failure, PlacesEntity> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (placesEntity) => SuccessGetPlaces(
        placesEntity:placesEntity
    ),
  );
}


