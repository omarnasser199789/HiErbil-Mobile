import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/wishlist/domain/entities/wishlist_entity.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../../domain/usecase/add_to_wishlist_usecase.dart';
import '../data_source/local_data_sourse/wishlist_local_data_source.dart';
import 'convert_to.dart';






class WishlistRepositoryImpl implements WishlistRepository{

  final WishlistLocalDataSource wishlistLocalDataSource;


  WishlistRepositoryImpl({

   required  this.wishlistLocalDataSource,
});


  @override
  Future<Either<Failure,int>> addProductToFav(AddProductToFavParams params) async {
    return await convertToInt((){
      return wishlistLocalDataSource.addProductToFav(params);
    });

  }

  @override
  Future<Either<Failure, List<WishlistEntity>>> getWishlist()async {
    return await convertToWishlistEntity((){
      return wishlistLocalDataSource.getWishlist();
    });
  }

  @override
  Future<Either<Failure, int>> isFav(int id) async{
    return await convertToInt((){
      return wishlistLocalDataSource.isFav(id);
    });
  }

  @override
  Future<Either<Failure, int>> deleteFromFav(int id)async {
    return await convertToInt((){
      return wishlistLocalDataSource.deleteFromFav(id);
    });
  }




}