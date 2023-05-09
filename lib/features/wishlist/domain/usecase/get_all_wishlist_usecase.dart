
import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/wishlist/domain/entities/wishlist_entity.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/wishlist_repository.dart';


class GetWishlistUseCase implements UseCase<List<WishlistEntity>, String> {
  final WishlistRepository repository;
  GetWishlistUseCase({required this.repository});

  @override
  Future<Either<Failure,List<WishlistEntity>>> call(String params) {

    return repository.getWishlist();
  }
}
