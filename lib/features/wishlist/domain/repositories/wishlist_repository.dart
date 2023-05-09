import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/wishlist_entity.dart';
import '../usecase/add_to_wishlist_usecase.dart';




abstract class WishlistRepository{

    Future<Either<Failure,int>> addProductToFav(AddProductToFavParams params);
    Future<Either<Failure,List<WishlistEntity>>> getWishlist();
    Future<Either<Failure,int>> isFav(int id);
    Future<Either<Failure,int>> deleteFromFav(int id);
}