part of 'match_board_bloc.dart';

abstract class MatchBoardEvent extends Equatable {
  const MatchBoardEvent();

  @override
  List<Object?> get props => [];
}

class OnGetMatchBoardList extends MatchBoardEvent {}

class OnGetRedirectUrl extends MatchBoardEvent {}
