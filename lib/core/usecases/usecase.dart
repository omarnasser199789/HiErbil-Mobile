import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';



//type is a return type of what else than call function


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// class NoParams  extends Params{
//   NoParams() : super(new User(name: ''));
//
//   @override
//   List<Object> get props => [];
// }

// class Params extends Equatable {
//   User user;
//
//   Params(this.user);
//
//   @override
//   List<Object> get props => [user];
// }