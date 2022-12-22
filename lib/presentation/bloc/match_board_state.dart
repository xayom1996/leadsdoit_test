part of 'match_board_bloc.dart';

abstract class MatchBoardState extends Equatable {
  const MatchBoardState();

  @override
  List<Object?> get props => [];
}

class MatchBoardInitial extends MatchBoardState {
  @override
  List<Object> get props => [];
}

class MatchBoardEmpty extends MatchBoardState {}

class MatchBoardLoading extends MatchBoardState {}

class MatchBoardError extends MatchBoardState {
  final String message;

  const MatchBoardError(this.message);

  @override
  List<Object?> get props => [message];
}

class MatchBoardFetched extends MatchBoardState {
  final List<MatchBoard> result;

  const MatchBoardFetched(this.result);

  @override
  List<Object?> get props => [result];
}

class ViewRedirectUrl extends MatchBoardState {
  final String result;

  const ViewRedirectUrl(this.result);

  @override
  List<Object?> get props => [result];
}


