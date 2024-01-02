import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/Controller/categories_controller.dart';
import 'package:wallpaper/Utils/color.dart';
import 'package:wallpaper/View/categories.dart';
import 'package:wallpaper/View/fav_wallpaper.dart';
import 'package:wallpaper/View/search.dart';

import 'latest_Wallpaper.dart';
import 'bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
            init: CategoryController(),
            builder: (CategoryController controller) {
              return IndexedStack(
                index: controller.index.value,
                children: const [
                  Categories(),
                  SearchWallpaper(),
                  LatestWallpaper(),
                  FavouriteWallpaper(),
                ],
              );
            }),
      ),
      backgroundColor: MyColor.black,
      bottomNavigationBar: const BottomBar(),
    );
  }
}
