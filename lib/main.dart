import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leadsdoit_test/presentation/bloc/match_board_bloc.dart';
import 'package:leadsdoit_test/presentation/pages/matchboard_page.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.locator<MatchBoardBloc>()..add(OnGetRedirectUrl()),
      child: const MaterialApp(
        title: 'MatchBoard',
        home: MatchBoardPage(),
      ),
    );
  }
}