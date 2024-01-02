import 'package:get/get.dart';
import 'package:wallpaper/Utils/global.dart';

class CategoryController extends GetxController {
  static CategoryController categoryController = Get.put(CategoryController());

  RxInt index = 0.obs;

  void selectCategory(String val) {
    Global.category = val;
    update();
  }

  pageIndex(int val) {
    index.value = val;
    Global.category = (index.value == 2) ? 'New Wallpaper' : '';
    print("Cat ${Global.category}");
    update();
  }
}
