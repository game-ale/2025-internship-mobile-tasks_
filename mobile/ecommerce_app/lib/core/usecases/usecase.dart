import "package:dartz/dartz.dart";
import "../error/failures.dart";

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
  @override
  bool operator ==(Object other) => identical(this, other) || other is NoParams;
  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}

class DeletedProductParams {
  final String id;
  DeletedProductParams(this.id);
}
