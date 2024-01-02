import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/Controller/set_wallpaper_controller.dart';
import 'package:wallpaper/Utils/color.dart';

import '../Utils/global.dart';

class SetWallpaper extends StatelessWidget {
  String img;
  SetWallpaper({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GetBuilder(
          init: WallpaperController(),
          builder: (WallpaperController controller) {
            return Container(
              decoration: BoxDecoration(
                  color: MyColor.white.withOpacity(0.1),
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  )
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            color: MyColor.red,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(MyColor.black.withOpacity(0.5)),
                            ),
                            onPressed: () => controller.favouriteWallpaper(context, img),
                            icon: const Icon(CupertinoIcons.heart_fill),
                          ),
                          IconButton(
                            color: MyColor.white,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(MyColor.black.withOpacity(0.5)),
                            ),
                            onPressed: () => Get.back(),
                            icon: const Icon(CupertinoIcons.clear),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                color: MyColor.white,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(MyColor.black.withOpacity(0.5)),
                                  fixedSize: MaterialStateProperty.all(const Size(50, 50)),
                                ),
                                onPressed: () => controller.downloadWallpaper(context, img),
                                icon: const Icon(CupertinoIcons.arrow_down_to_line_alt, size: 30),
                                tooltip: "Download",
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Download",
                                style: TextStyle(color: MyColor.white),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              IconButton(
                                color: MyColor.white,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(MyColor.black.withOpacity(0.5)),
                                  fixedSize: MaterialStateProperty.all(const Size(50, 50)),
                                ),
                                onPressed: () => controller.setHomeScreen(context, img),
                                icon: const Icon(CupertinoIcons.house_fill, size: 30),
                                tooltip: "Home Screen",
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Home",
                                style: TextStyle(color: MyColor.white),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              IconButton(
                                color: MyColor.white,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(MyColor.black.withOpacity(0.5)),
                                  fixedSize: MaterialStateProperty.all(const Size(50, 50)),
                                ),
                                onPressed: () => controller.setLockScreen(context, img),
                                icon: const Icon(CupertinoIcons.lock_fill, size: 30),
                                tooltip: "Lock Screen",
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Lock",
                                style: TextStyle(color: MyColor.white),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              IconButton(
                                color: MyColor.white,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(MyColor.black.withOpacity(0.5)),
                                  fixedSize: MaterialStateProperty.all(const Size(50, 50)),
                                ),
                                onPressed: () => controller.setBothScreen(context, img),
                                icon: const Icon(CupertinoIcons.arrow_left_right, size: 30),
                                tooltip: "Both Screen",
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Both",
                                style: TextStyle(color: MyColor.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
