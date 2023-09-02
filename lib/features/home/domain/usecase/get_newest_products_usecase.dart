import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repository.dart';

class GetNewestProductsUseCase implements UseCase<List<ProductEntity>, dynamic> {
  final HomeRepository repository;
  GetNewestProductsUseCase({required this.repository});

  @override
  Future<Either<Failure,List<ProductEntity>>> call(dynamic) {
    return repository.getNewestProducts();
  }
}

