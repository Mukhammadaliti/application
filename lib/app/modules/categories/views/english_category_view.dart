import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:cashe_register/app/constans/app_text.dart';
import 'package:cashe_register/app/constans/app_text_styles.dart';
// import 'package:cashe_register/app/model/invoice_model.dart';
// import 'package:cashe_register/app/modules/categories/controllers/categories_controller.dart';
import 'package:cashe_register/app/modules/categories/widgets/search_widget.dart';
import 'package:cashe_register/app/modules/home/controllers/home_controller.dart';
import 'package:cashe_register/app/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EnglishCategory extends StatelessWidget {
  EnglishCategory({
    Key? key,
  }) : super(key: key);
  final _homeController = Get.put(HomeController());
  // final _categoriesController = Get.put(CategoriesController());
  dynamic productList;
  final Stream<QuerySnapshot> _productStream =
      FirebaseFirestore.instance.collection('receipt').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _productStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: CustomAppBar(
                text: AppText.englText,
                child: IconButton(
                    onPressed: () {
                      _homeController.navigateToHomeView(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.whiteF5,
                    )),
              ),
            ),
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SearchWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 900,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.09,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: AppColors.grey,
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                        0,
                                        3,
                                      ))
                                ],
                                borderRadius: BorderRadius.circular(10.06),
                                color: AppColors.whiteFC),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Цена - ${productList['amout']} ',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.black15wBlodFgen),
                                    Text(
                                      productList['date'],
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.green16w700,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(productList['firstName'],
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.black22wBold),
                                    Text(productList['invoicesNumber'],
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.greyOA16wBold),
                                    Text(
                                      productList['time'],
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.green16w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
