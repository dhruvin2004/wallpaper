import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/Controller/set_wallpaper_controller.dart';
import 'package:wallpaper/View/wallpaper.dart';

import '../Utils/color.dart';
import '../Utils/global.dart';

class FavouriteWallpaper extends StatelessWidget {
  const FavouriteWallpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: WallpaperController(),
        builder: (WallpaperController controller) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            cacheExtent: 200,
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text(
                  'Favourite',
                  style: TextStyle(color: MyColor.white),
                ),
                backgroundColor: MyColor.black,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if(Global.favWallpaper.isNotEmpty) {
                          return GridView.builder(
                            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 350,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: Global.favWallpaper.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: GestureDetector(
                                  onTap: () => Get.to(() => SetWallpaper(img: Global.favWallpaper[index].img!,)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: MyColor.white.withOpacity(0.1),
                                        image: DecorationImage(
                                          image: NetworkImage(Global.favWallpaper[index].img!),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      color: MyColor.white,
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(MyColor.black.withOpacity(0.5)),
                                      ),
                                      onPressed: () => controller.removeFavWallpaper(context, index),
                                      icon: const Icon(CupertinoIcons.delete),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Container(
                            height: Global.height - 200,
                            alignment: Alignment.center,
                            child: Text("No Data Found", style: TextStyle(color: MyColor.white),),
                          );
                        }
                  },
                  childCount: 1,
                ),
              )
            ],
          );
        }
    );
  }
}