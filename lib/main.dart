import 'package:cashe_register/app/modules/auth/controllers/auth_controller.dart';
import 'package:cashe_register/app/modules/auth/views/auth_view.dart';
import 'package:cashe_register/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value)=> Get.put(AuthController(),),);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      // initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
      home: AuthView(),
    ),
  );
}

