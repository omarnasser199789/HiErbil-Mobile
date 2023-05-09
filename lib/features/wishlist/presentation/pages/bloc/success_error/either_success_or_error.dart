import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/posts/domain/entities/post_entity.dart';
import 'package:hi_erbil_mobile/features/wishlist/presentation/pages/bloc/bloc.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/globals.dart';
import '../../../../domain/entities/wishlist_entity.dart';
import '../wishlist_state.dart';


Stream<WishlistState> SuccessAddToWishlistOrErrorState(
  Either<Failure, int> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (params) => SuccessAddToWishlist(),
  );
}

Stream<WishlistState> SuccessGetIsFavOrErrorState(
  Either<Failure, int> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (fav) => SuccessGetIsFav(fav:fav),
  );
}

Stream<WishlistState> SuccessGetWishlistOrErrorState(
  Either<Failure, List<WishlistEntity>> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (wishlistEntity) => SuccessGetWishlist(wishlistEntity: wishlistEntity),
  );
}
Stream<WishlistState> SuccessDeleteFromFavOrErrorState(
  Either<Failure, int> failureOrSuccess,
) async* {
  yield failureOrSuccess.fold(
    (failure) => Error(message: mapFailureToMessage(failure)),
    (wishlistEntity) => SuccessDeleteFromFav(),
  );
}

