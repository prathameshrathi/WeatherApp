import 'package:http/http.dart';
import 'dart:convert';

class Networking{
  String urlString;
  Networking(this.urlString);

  Future getWeatherData() async
  {
    final url = Uri.parse(urlString);
    Response response = await get(url);
    var decoded = jsonDecode(response.body);
    return decoded;
  }
}