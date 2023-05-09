import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_erbil_mobile/features/posts/presentation/bloc/success_error/either_success_or_error.dart';
import 'package:hi_erbil_mobile/features/wishlist/presentation/pages/bloc/success_error/either_success_or_error.dart';
import '../../../domain/usecase/add_to_wishlist_usecase.dart';

import '../../../domain/usecase/delete_from_fav_usecase.dart';
import '../../../domain/usecase/get_all_wishlist_usecase.dart';
import '../../../domain/usecase/is_fav_usecase.dart';
import 'bloc.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final AddToWishlistUseCase addToWishlistUseCase;
  final GetWishlistUseCase getWishlistUseCase;
  final IsFavUseCase isFavUseCase;
  final DeleteFromFavUseCase deleteFromFavUseCase;







  WishlistBloc({
    required AddToWishlistUseCase concreteAddToWishlistUseCase,
    required GetWishlistUseCase concreteGetWishlistUseCase,
    required IsFavUseCase concreteIsFavUseCase,
    required DeleteFromFavUseCase concreteDeleteFromFavUseCase,






  })  : assert(
  concreteAddToWishlistUseCase != null,
        ),
        addToWishlistUseCase = concreteAddToWishlistUseCase,
        getWishlistUseCase = concreteGetWishlistUseCase,
        isFavUseCase = concreteIsFavUseCase,
        deleteFromFavUseCase = concreteDeleteFromFavUseCase,





        super(Empty());

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {

    if(event is AddToWishlistEvent){
      yield Loading();
      final failureOrPhysician = await addToWishlistUseCase(event.params);
      yield* SuccessAddToWishlistOrErrorState(failureOrPhysician);
    }
    if(event is GetWishlistEvent){
      yield Loading();
      final failureOrPhysician = await getWishlistUseCase("");
      yield* SuccessGetWishlistOrErrorState(failureOrPhysician);
    }
    if(event is IsFavEvent){
      yield Loading();
      final failureOrPhysician = await isFavUseCase(event.id);
      yield* SuccessGetIsFavOrErrorState(failureOrPhysician);
    }
    if(event is DeleteFromFavEvent){
      yield Loading();
      final failureOrPhysician = await deleteFromFavUseCase(event.id);
      yield* SuccessDeleteFromFavOrErrorState(failureOrPhysician);
    }




  }
}
