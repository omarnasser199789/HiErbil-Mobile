import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/map_items_entity.dart';
import '../repositories/home_repository.dart';


class GetMapItemsUseCase implements UseCase<MapItemsEntity, int> {
  final HomeRepository repository;
  GetMapItemsUseCase({required this.repository});

  @override
  Future<Either<Failure,MapItemsEntity>> call(int params) {

    return repository.getMapItems();
  }
}

