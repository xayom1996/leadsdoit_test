import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leadsdoit_test/data/models/match_board.dart';
import 'package:leadsdoit_test/data/repositories/api_match_boards_loader.dart';

part 'match_board_event.dart';
part 'match_board_state.dart';

class MatchBoardBloc extends Bloc<MatchBoardEvent, MatchBoardState> {
  final ApiMatchBoardsLoader _apiMatchBoardsLoader;

  MatchBoardBloc(this._apiMatchBoardsLoader) : super(MatchBoardInitial()) {
    on<OnGetMatchBoardList>((event, emit) async {
      emit(MatchBoardLoading());

      final result = await _apiMatchBoardsLoader.getMatch();
      result.fold(
            (failure) {
              emit(MatchBoardError(failure.message));
            },
            (data) {
              emit(MatchBoardFetched(data));
            },
      );
    });
    on<OnGetRedirectUrl>((event, emit) async {
      emit(MatchBoardLoading());

      final result = await _apiMatchBoardsLoader.getRedirectUrl();
      
      if (result.contains('google.com')) {
        add(OnGetMatchBoardList());
      } else {
        emit(ViewRedirectUrl(result));
      }
    });
  }
}
