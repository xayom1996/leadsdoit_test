import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leadsdoit_test/data/models/match_board.dart';

class MatchBoardContainer extends StatelessWidget {
  final MatchBoard matchBoard;
  const MatchBoardContainer({Key? key, required this.matchBoard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xff383838),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: const Color(0xff242424),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'assets/icons/cup.svg',
                ),
                SizedBox(width: 13),
                Expanded(
                  child: Text(
                    matchBoard.leagueName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )
                ),
                // const Spacer(),
                Text(
                  matchBoard.getMonthDay(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            matchBoard.status,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              fontStyle: FontStyle.italic,
              color: matchBoard.status.contains('Live')
                  ? Color(0xffFF7B31)
                  : Color(0xffB9B9B9),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Center(
                child: Text(
                  matchBoard.homeTeam,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              )),
              Container(
                height: 61,
                width: 2,
                color: Color(0xff535353),
              ),
              Expanded(child: Center(
                child: Text(
                  matchBoard.awayTeam,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: const Color(0xff242424),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      matchBoard.getHomeScore(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: matchBoard.status.contains('Live')
                            ? Color(0xffFF7B31)
                            : Colors.white,
                      ),
                    )
                  )
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      matchBoard.getAwayScore(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: matchBoard.status.contains('Live')
                            ? Color(0xffFF7B31)
                            : Colors.white,
                      ),
                    )
                  )
                ),
              ],
            ),
          ),
        ],
      )
    )
    ;
  }
}
