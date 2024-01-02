import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wallpaper/Controller/categories_controller.dart';
import 'package:wallpaper/View/wallpaper_response.dart';

import '../Utils/color.dart';

class SearchWallpaper extends StatelessWidget {
  const SearchWallpaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CategoryController(),
      builder: (CategoryController controller) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15,15,15,0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                style: TextStyle(
                  color: MyColor.white,
                ),
                onChanged: controller.selectCategory,
              ),
              const SizedBox(height: 5,),
              const Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: WallpaperResponse(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
