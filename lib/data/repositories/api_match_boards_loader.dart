import 'package:dartz/dartz.dart';
import 'package:leadsdoit_test/data/datasources/remote_data_source.dart';
import 'package:leadsdoit_test/data/exception.dart';
import 'package:leadsdoit_test/data/failure.dart';
import 'package:leadsdoit_test/data/models/match_board.dart';
import 'package:leadsdoit_test/data/repositories/match_boards_loader.dart';

class ApiMatchBoardsLoader implements MatchBoardsLoader {
  final RemoteDataSource remoteDataSource;

  ApiMatchBoardsLoader({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MatchBoard>>> getMatch() async {
    try {
      final result = await remoteDataSource.getMatch();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<String> getRedirectUrl() async {
    final result = await remoteDataSource.getRedirectUrl();
    return result;
  }
}