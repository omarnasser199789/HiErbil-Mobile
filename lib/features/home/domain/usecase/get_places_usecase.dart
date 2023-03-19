
import 'package:dartz/dartz.dart';
import 'package:hi_erbil_mobile/features/home/domain/entities/categories_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/banners_entity.dart';
import '../entities/places_entity.dart';
import '../repositories/home_repository.dart';


class GetPlacesUseCase implements UseCase<PlacesEntity, GetPlacesParams> {
  final HomeRepository repository;
  GetPlacesUseCase({required this.repository});

  @override
  Future<Either<Failure,PlacesEntity>> call(GetPlacesParams params) {

    return repository.getPlaces(params);
  }
}

class GetPlacesParams{
  String ? type;
  GetPlacesParams({this.type});
}