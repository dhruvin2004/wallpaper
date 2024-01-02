import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/View/wallpaper.dart';

import '../Controller/categories_controller.dart';
import '../Model/wallpaper_model.dart';
import '../Service/http_service.dart';
import '../Utils/color.dart';
import '../Utils/global.dart';

class WallpaperResponse extends StatelessWidget {
  const WallpaperResponse({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CategoryController(),
        builder: (CategoryController controller) {
        return FutureBuilder(
          future: HttpService.httpService.wallpaperResponse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("Snapshot :: ${snapshot.data}");
              List<Hit> data = snapshot.data!;
              return GridView.builder(
                padding: const EdgeInsets.only(top: 15),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 350,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GestureDetector(
                      onTap: () => Get.to(() => SetWallpaper(img: data[index].largeImageUrl!,)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColor.white.withOpacity(0.1),
                          image: DecorationImage(
                            image: NetworkImage(data[index].largeImageUrl!),
                            fit: BoxFit.cover,
                          )
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
                child: CircularProgressIndicator(backgroundColor: MyColor.themeColor, color: MyColor.black),
              );
            }
          },
        );
      }
    );
  }
}
