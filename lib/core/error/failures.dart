import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
class FFailure extends Failure {
  FFailure({required this.StatusCode});
  int StatusCode;
}
