import 'package:get/get.dart';

import '../Model/fav_wallpaper_model.dart';


class Global {
  static double height = Get.height;
  static double width = Get.width;
  static String BASE_URL = "https://pixabay.com/api/?key=35854751-c38189c7a61b5ca423d66e0d3&q=";
  static String category = "";
  static List<FavWallpaper> favWallpaper = [];
}
