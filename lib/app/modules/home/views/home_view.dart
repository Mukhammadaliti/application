import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:cashe_register/app/constans/app_text.dart';
import 'package:cashe_register/app/modules/auth/controllers/auth_controller.dart';
import 'package:cashe_register/app/modules/home/widgets/lessons_constants_widget.dart';
import 'package:cashe_register/app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
  }) : super(key: key);
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            text: AppText.firsPageText,
            child: IconButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      'Log Out',
                      style: TextStyle(
                          color: AppColors.black, fontFamily: "Genium"),
                    ),
                    content: const Text(
                      'Do you want to go out?',
                      style: TextStyle(fontFamily: "Genium"),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              AuthController.instance.logOut();
                              _homeController.navigateToAuthView(context);
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'No'),
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: AppColors.white,
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                LessonsConstansWidget(
                  images: "assets/images/english.png",
                  lessonText: AppText.englText,
                  ontap: () {
                    _homeController.navigateToEnglishCategory(context);
                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                LessonsConstansWidget(
                  images: "assets/images/ort.png",
                  lessonText: AppText.ortText,
                  ontap: () {
                    _homeController.navigateToORTCategory(context);
                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                LessonsConstansWidget(
                  images: "assets/images/it.png",
                  lessonText: AppText.itText,
                  ontap: () {
                    _homeController.navigateToITCategory(context);
                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                LessonsConstansWidget(
                  images: "assets/images/matem.png",
                  lessonText: AppText.mathText,
                  ontap: () {
                    _homeController.navigateToMatematicsCategory(context);
                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                LessonsConstansWidget(
                  images: "assets/images/rus.png",
                  lessonText: AppText.rusText,
                  ontap: () {
                    _homeController.navigateToRussianCategory(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.green50,
          onPressed: () {
            _homeController.navigateToReceiptView(context);
          },
          child: const Icon(
            Icons.post_add_rounded,
            size: 30,
            color: AppColors.white,
          )),
    );
  }
}
