import 'package:dio/dio.dart';
import '../const.dart';
import '../models/Event.dart';

class EventServices {
  static Future<List<Event>> getEvents() async {
    try {
      Response response = await Dio().get("$baseUrl/events");

      List<Event> temp = [];
      response.data.forEach((event) => temp.add(Event.fromJson(event)));
      return temp;
    } catch (e) {
      print(e);
    }
  }
}
