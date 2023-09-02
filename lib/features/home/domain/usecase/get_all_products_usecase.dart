import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product_entity.dart';
import '../entities/products_list_entity.dart';
import '../repositories/home_repository.dart';


class GetAllProductsUseCase implements UseCase<ProductListEntity, dynamic> {
  final HomeRepository repository;
  GetAllProductsUseCase({required this.repository});

  @override
  Future<Either<Failure,ProductListEntity>> call(dynamic) {
    return repository.getAllProducts();
  }
}

