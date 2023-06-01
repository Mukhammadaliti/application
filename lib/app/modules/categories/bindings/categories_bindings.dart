import 'package:cashe_register/app/modules/categories/controllers/categories_controller.dart';
import 'package:get/get.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
  }
}
