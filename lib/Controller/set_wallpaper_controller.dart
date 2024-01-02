// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper/Model/fav_wallpaper_model.dart';

import '../Utils/color.dart';
import '../Utils/global.dart';

class WallpaperController extends GetxController {
  static WallpaperController wallpaperController = WallpaperController();
  CollectionReference favWallpaper = FirebaseFirestore.instance.collection('favWallpaper');

  snackBar(BuildContext context, String title) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
      backgroundColor: MyColor.themeColor,
      duration: const Duration(seconds: 2),
    ));
  }

  toast(String title) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  downloadWallpaper(BuildContext context, String img) async {
    ScreenshotController screenshotController = ScreenshotController();
    var status = await Permission.storage.request();
    if(status.isGranted) {
      toast('Downloaded...');
      Uint8List? imageBytes = await screenshotController.captureFromWidget(
        Stack(alignment: Alignment.center, children: [
          Image.network(
            img,
            height: Global.height,
            fit: BoxFit.cover,
          ),
        ]),
      );
      await ImageGallerySaver.saveImage(imageBytes, quality: 100);
    }
    update();
  }

  favouriteWallpaper(BuildContext context, String img) async {
    Global.favWallpaper.add(FavWallpaper(img: img));
    toast('Added...');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String encodedData = FavWallpaper.encode(Global.favWallpaper);
    await sharedPreferences.setString('wallpaper', encodedData);
    update();
  }

  removeFavWallpaper(BuildContext context, int index) async {
    Global.favWallpaper.removeAt(index);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String encodedData = FavWallpaper.encode(Global.favWallpaper);
    await sharedPreferences.setString('wallpaper', encodedData);
    snackBar(context, 'Deleted...');
    update();
  }

  setHomeScreen(BuildContext context, String img) async {
    Get.back();
    snackBar(context, 'Set As a Home Screen');
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(img);
    bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    print("Wallpaper :: $result");
    update();
  }

  setLockScreen(BuildContext context, String img) async {
    Get.back();
    snackBar(context, 'Set As a Lock Screen');
    int location = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(img);
    bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    update();
  }

  setBothScreen(BuildContext context, String img) async {
    Get.back();
    snackBar(context, 'Set As a Both Screen');
    int location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(img);
    bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
    update();
  }
}
