import 'package:dartz/dartz.dart';
import 'package:leadsdoit_test/data/failure.dart';
import 'package:leadsdoit_test/data/models/match_board.dart';

abstract class MatchBoardsLoader {
  Future<Either<Failure, List<MatchBoard>>> getMatch();
  Future<String> getRedirectUrl();
}