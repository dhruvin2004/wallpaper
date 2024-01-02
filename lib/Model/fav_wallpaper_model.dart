import 'dart:convert';

class FavWallpaper {
  String? img;

  FavWallpaper({
    this.img,
  });

  factory FavWallpaper.fromJson(Map<String, dynamic> json) => FavWallpaper(
    img: json["img"],
  );

  static Map<String, dynamic> toJson(FavWallpaper wallpaper) => {
    "img": wallpaper.img,
  };

  static String encode(List<FavWallpaper> wallpapers) => json.encode(
    wallpapers
        .map<Map<String, dynamic>>((wallpaper) => FavWallpaper.toJson(wallpaper))
        .toList(),
  );

  static List<FavWallpaper> decode(String wallpapers) =>
      (json.decode(wallpapers) as List<dynamic>)
          .map<FavWallpaper>((item) => FavWallpaper.fromJson(item))
          .toList();
}
