import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:cashe_register/app/constans/app_text.dart';
import 'package:cashe_register/app/modules/categories/controllers/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
  });
  final CategoriesController _categoriesController =
      Get.put(CategoriesController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Column(
        children: [
          TextFormField(
            controller: _categoriesController.searchController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search_sharp,
                size: 22,
              ),
              fillColor: AppColors.whiteF5,
              filled: true,
              hintStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Gentium",
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyOA),
              hintText: AppText.searchWidgetText.toUpperCase(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 2.0),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста напишите Имя ученика';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
