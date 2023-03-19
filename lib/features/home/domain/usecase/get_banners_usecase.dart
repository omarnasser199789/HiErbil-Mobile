
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/banners_entity.dart';
import '../repositories/home_repository.dart';


class GetBannersUseCase implements UseCase<BannersEntity, String> {
  final HomeRepository repository;
  GetBannersUseCase({required this.repository});

  @override
  Future<Either<Failure,BannersEntity>> call(String noParams) {

    return repository.getBanners();
  }
}
