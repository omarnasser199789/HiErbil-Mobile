
import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/categories_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/banners_entity.dart';
import '../entities/place_entity.dart';
import '../entities/places_entity.dart';
import '../repositories/home_repository.dart';


class GetPlaceByIdUseCase implements UseCase<PlaceEntity, int> {
  final HomeRepository repository;
  GetPlaceByIdUseCase({required this.repository});

  @override
  Future<Either<Failure,PlaceEntity>> call(int id) {

    return repository.getPlaceById(id);
  }
}

