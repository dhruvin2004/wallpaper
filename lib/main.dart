import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper/Model/fav_wallpaper_model.dart';
import 'package:wallpaper/View/splash_screen.dart';

import 'Utils/global.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(sharedPreferences.getString('wallpaper') != null) {
    String decodeData = sharedPreferences.getString('wallpaper')!;
    Global.favWallpaper = FavWallpaper.decode(decodeData);
  }
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
    ),
  );
}
