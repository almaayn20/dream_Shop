import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

abstract class UseCase2<Type, Param, Param2> {
  Future<Either<Failure, Type>> call(
      {required Param param, required Param2 param2});
}

abstract class UseCase3<Type, Param> {
  Future<Either<Failure, Type>> call({required Param param});
}

class NoParam {}
