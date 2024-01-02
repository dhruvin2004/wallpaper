import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/categories_controller.dart';
import '../Utils/color.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
      backgroundColor: MyColor.black,
      currentIndex: CategoryController.categoryController.index.value,
      onTap: CategoryController.categoryController.pageIndex,
      unselectedItemColor: MyColor.grey,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: MyColor.themeColor,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.category_rounded),
          icon: Icon(Icons.category_outlined),
          label: "Categories",
          tooltip: "Categories",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(CupertinoIcons.search),
          icon: Icon(CupertinoIcons.search),
          label: "Search",
          tooltip: "Search",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.now_wallpaper_rounded),
          icon: Icon(Icons.now_wallpaper_rounded),
          label: "New",
          tooltip: "New",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(CupertinoIcons.heart_fill),
          icon: Icon(CupertinoIcons.heart),
          label: "Favourite",
          tooltip: "Favourite",
        ),
      ],
    ));
  }
}