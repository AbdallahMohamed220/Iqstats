import 'package:dio/dio.dart';
import '../const.dart';
import '../models/MatchData.dart';
import '../models/MatchEvent.dart';

class MatchServices {
  static Future<MatchData> getMatchData(String id) async {
    try {
      Response response = await Dio().get("$baseUrl/match/$id");
      // print(response.data);
      return MatchData.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  static Future<List<MatchEvent>> getMatchEvents({
    String matchId,
    String events,
    String firstTeamPlayers,
    String secondTeamPlayers,
    String startAtMins,
    String endAtMins,
  }) async {
    String requestUrl = "$baseUrl/events/$matchId?id=matchId";

    if (startAtMins != null) {
      requestUrl += requestUrl + "&start_time_mins=$startAtMins";
    }

    if (endAtMins != null) {
      requestUrl += requestUrl + "&end_time_mins=$endAtMins";
    }

    if (events != null) {
      requestUrl += requestUrl + "&events=$events";
    }

    if (firstTeamPlayers != null) {
      requestUrl += requestUrl + "&first_team_players=$firstTeamPlayers";
    }

    if (secondTeamPlayers != null) {
      requestUrl += requestUrl + "&second_team_players=$secondTeamPlayers";
    }

    try {
      Response response = await Dio().get(requestUrl);

      List<MatchEvent> temp = [];
      response.data.forEach((event) => temp.add(MatchEvent.fromJson(event)));
      return temp;
    } catch (e) {
      print(e);
    }
  }
}
