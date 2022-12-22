import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leadsdoit_test/presentation/bloc/match_board_bloc.dart';
import 'package:leadsdoit_test/presentation/widgets/custom_web_view.dart';
import 'package:leadsdoit_test/presentation/widgets/matchboard_container.dart';

class MatchBoardPage extends StatelessWidget {
  const MatchBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBoardBloc, MatchBoardState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff121212),
          appBar: state is! MatchBoardLoading
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(110),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    color: const Color(0xff242424),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/icons/ball.svg',
                      ),
                    ),
                  ),
                )
              : null,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<MatchBoardBloc, MatchBoardState>(
              builder: (context, state) {
                if (state is MatchBoardFetched) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var matchBoard in state.result)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: MatchBoardContainer(matchBoard: matchBoard),
                          ),
                      ],
                    ),
                  );
                } else if (state is MatchBoardLoading) {
                  return Center(
                    child: SvgPicture.asset(
                      'assets/icons/ball.svg',
                      height: 103,
                      width: 103,
                    ),
                  );
                } else if (state is MatchBoardError) {
                  return Center(
                    child: Text(
                      state.message,
                    ),
                  );
                } else if (state is ViewRedirectUrl) {
                  return CustomWebView(url: state.result);
                } else {
                  return const SizedBox.shrink();
                }
              }
            ),
          ),
        );
      }
    );
  }
}
