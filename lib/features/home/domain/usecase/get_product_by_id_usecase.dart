import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repository.dart';

class GetProductsByIdUseCase implements UseCase<ProductEntity, int> {
  final HomeRepository repository;
  GetProductsByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductEntity>> call(int id) {
    return repository.getProductById(id);
  }
}

