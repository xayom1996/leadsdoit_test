import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leadsdoit_test/data/constants.dart';
import 'package:leadsdoit_test/data/exception.dart';
import 'package:leadsdoit_test/data/models/match_board.dart';

abstract class RemoteDataSource {
  Future<List<MatchBoard>> getMatch();
  Future<String> getRedirectUrl();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<MatchBoard>> getMatch() async {
    final response = await client.get(Uri.parse(eventUrl));

    if (response.statusCode == 200) {
      var responseBody = json.decode(response.body);
      return List<MatchBoard>.from(responseBody['event'].map((item) => MatchBoard.fromJson(item)));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> getRedirectUrl() async {
    http.Request req = http.Request("Get", Uri.parse(preLoaderUrl))..followRedirects = false;
    final response = await client.send(req);
    // return 'https://www.thesportsdb.com';
    if (response.headers['location'] != null) {
      return response.headers['location']!;
    }
    return 'https://google.com/';
  }
}