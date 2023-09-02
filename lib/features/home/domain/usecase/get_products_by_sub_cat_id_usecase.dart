import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repository.dart';


class GetProductsBySubCatIdUseCase implements UseCase<List<ProductEntity>, int> {
  final HomeRepository repository;
  GetProductsBySubCatIdUseCase({required this.repository});

  @override
  Future<Either<Failure,List<ProductEntity>>> call(int id) {
    return repository.getProductBySubCatId(id);
  }
}

