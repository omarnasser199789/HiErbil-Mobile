
import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/categories_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/banners_entity.dart';
import '../repositories/home_repository.dart';


class GetCategoriesUseCase implements UseCase<CategoriesEntity, String> {
  final HomeRepository repository;
  GetCategoriesUseCase({required this.repository});

  @override
  Future<Either<Failure,CategoriesEntity>> call(String noParams) {

    return repository.getCategories();
  }
}
