import 'dart:convert';

import 'package:http/http.dart';
import 'package:wallpaper/Model/wallpaper_model.dart';
import 'package:wallpaper/Utils/global.dart';

class HttpService {
  static HttpService httpService = HttpService();

  Future<List<Hit>> wallpaperResponse() async {
    Response response = await get(Uri.parse(Global.BASE_URL + Uri.encodeQueryComponent(Global.category)));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['hits'];
      List<Hit> wallpaper = data.map((e) => Hit.fromJson(e)).toList();
      print("Data :: $wallpaper");
      return wallpaper;
    } else {
      return [];
    }
  }
}
