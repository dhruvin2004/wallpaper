import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wallpaper/Controller/categories_controller.dart';
import 'package:wallpaper/View/wallpaper_response.dart';

import '../Utils/color.dart';

class LatestWallpaper extends StatelessWidget {
  const LatestWallpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CategoryController(),
      builder: (CategoryController controller) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          cacheExtent: 200,
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text(
                'New Wallpaper',
                style: TextStyle(color: MyColor.white),
              ),
              backgroundColor: MyColor.black,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: WallpaperResponse(),
                      );
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
