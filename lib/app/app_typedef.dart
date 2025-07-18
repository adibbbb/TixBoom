import 'package:dartz/dartz.dart';
import 'error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<void>;
typedef ResultBool = ResultFuture<bool>;
typedef DataMap = Map<String, dynamic>;
