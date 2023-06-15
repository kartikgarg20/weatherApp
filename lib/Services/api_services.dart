import 'package:http/http.dart' as http;

import '../Data/keys/keys.dart';

class RemoteService {
  // client for the api call
  static var client = http.Client();

  // the get api call
  static Future get({required String lat, required String long}) async {
    try {
      // the key which is requred for the api call of the open weather
      var key = MyKeys.key;
      var response = await client.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$key'));

      if (response.statusCode == 200) {
        // manageing the recieved data
        var data = response.body;
        return data;
      }
    } catch (e) {
      // handeling the Exceptions
      throw Exception('Error: $e');
    }
  }
}
