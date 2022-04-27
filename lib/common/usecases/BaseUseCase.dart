import 'package:flutter_short_music/common/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}