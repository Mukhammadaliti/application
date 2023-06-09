import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:cashe_register/app/constans/app_text.dart';
import 'package:cashe_register/app/modules/auth/controllers/auth_controller.dart';
import 'package:cashe_register/app/modules/categories/widgets/search_widget.dart';
import 'package:cashe_register/app/modules/home/controllers/home_controller.dart';
import 'package:cashe_register/app/modules/home/widgets/custom_snack_bar.dart';
import 'package:cashe_register/app/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItCategory extends StatelessWidget {
  ItCategory({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());
  // AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    String? documentId;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return customSnackBar("Something went wrong", '', '');
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return customSnackBar("Document does not exist", '', '');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        customSnackBar("loading", 'loading', 'loading');
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(
              text: AppText.itText,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
