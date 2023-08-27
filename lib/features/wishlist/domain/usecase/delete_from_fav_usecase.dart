import 'package:dartz/dartz.dart';
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
