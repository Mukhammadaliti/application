import 'package:cashe_register/app/modules/auth/bindings/auth_binding.dart';
import 'package:cashe_register/app/modules/auth/views/auth_view.dart';
import 'package:cashe_register/app/modules/categories/bindings/categories_bindings.dart';
import 'package:cashe_register/app/modules/categories/views/english_category_view.dart';
import 'package:cashe_register/app/modules/receipt/bindings/receipt_bindings.dart';
import 'package:cashe_register/app/modules/receipt/views/receipt_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.RECEIPT,
      page: () => const ReceiptView(),
      binding: ReceiptBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => EnglishCategory(),
      binding: CategoriesBinding(),
    ),
  ];
}
