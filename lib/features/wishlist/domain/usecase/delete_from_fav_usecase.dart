
import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/wishlist/domain/entities/wishlist_entity.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/wishlist_repository.dart';


class DeleteFromFavUseCase implements UseCase<int, int> {
  final WishlistRepository repository;
  DeleteFromFavUseCase({required this.repository});

  @override
  Future<Either<Failure,int>> call(int id) {

    return repository.deleteFromFav(id);
  }
}
