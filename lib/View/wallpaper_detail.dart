import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/View/wallpaper_response.dart';

import '../Utils/color.dart';

class WallpaperDetails extends StatelessWidget {
  String title;
  WallpaperDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        cacheExtent: 200,
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            padding: const EdgeInsetsDirectional.only(start: 5),
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(CupertinoIcons.back, color: MyColor.white),
            ),
            largeTitle: Text(
              title,
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
      ),
      backgroundColor: MyColor.black,
    );
  }
}
