import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:leadsdoit_test/data/datasources/remote_data_source.dart';
import 'package:leadsdoit_test/data/repositories/api_match_boards_loader.dart';
import 'package:leadsdoit_test/presentation/bloc/match_board_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => MatchBoardBloc(locator()));

  // repository
  locator.registerLazySingleton<ApiMatchBoardsLoader>(
        () => ApiMatchBoardsLoader(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}