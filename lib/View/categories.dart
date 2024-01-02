import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/Controller/categories_controller.dart';
import 'package:wallpaper/View/wallpaper_detail.dart';

import '../Utils/color.dart';
import '../Utils/global.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

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
                'Categories',
                style: TextStyle(color: MyColor.white),
              ),
              backgroundColor: MyColor.black,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Category').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(child: Text("Something went Wrong!!"));
                      } else if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: Global.height - 200,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(backgroundColor: MyColor.themeColor, color: MyColor.black),
                        );
                      } else {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            List data = snapshot.data!.docs;
                            return GestureDetector(
                              onTap: () {
                                controller.selectCategory(data[index]['name']);
                                Get.to(() => WallpaperDetails(
                                  title: data[index]['name'],
                                ));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.only(left: 20, bottom: 10),
                                height: 120,
                                width: Global.width,
                                decoration: BoxDecoration(
                                    color: MyColor.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: NetworkImage(data[index]['img']),
                                      fit: BoxFit.cover,
                                    )),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  data[index]['name'],
                                  style: TextStyle(color: MyColor.white, fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
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
