
import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/categories_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/banners_entity.dart';
import '../entities/places_entity.dart';
import '../entities/tags_entity.dart';
import '../repositories/home_repository.dart';


class GetTagsUseCase implements UseCase<TagsEntity, int?> {
  final HomeRepository repository;
  GetTagsUseCase({required this.repository});

  @override
  Future<Either<Failure,TagsEntity>> call(int? catId) {

    return repository.getTags(catId);
  }
}

