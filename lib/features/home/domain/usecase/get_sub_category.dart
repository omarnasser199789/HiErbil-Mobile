import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_sub_category_entity.dart';
import '../entities/tags_entity.dart';
import '../repositories/home_repository.dart';


class GetSubCategoryUseCase implements UseCase<List<SubCategoryEntity>, int> {
  final HomeRepository repository;
  GetSubCategoryUseCase({required this.repository});

  @override
  Future<Either<Failure,List<SubCategoryEntity>>> call(int id) {
    return repository.getSubCategory(id);
  }
}

