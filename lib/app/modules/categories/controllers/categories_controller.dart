// import 'package:cashe_register/app/model/invoice_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  // RxList dataList = <String>[].obs;

  // @override
  // void onInit() {
  //   fetchDataAsList();
  //   super.onInit();
  // }

  // Future<void> fetchDataAsList() async {
  //   try {
  //     QuerySnapshot querySnapshot =
  //         await FirebaseFirestore.instance.collection('receipt').get();

  //     List<String> newDataList = [];
  //     querySnapshot.docs.forEach((doc) {
  //       String data = doc.data()[
  //           'receipt']; // Замените 'your_field' на имя поля, которое вы хотите получить
  //       newDataList.add(data);
  //     });

  //     setState(() {
  //       dataList = newDataList;
  //     });
  //   } catch (e) {
  //     print('Ошибка при получении данных из Firestore: $e');
  //   }
  // }
}
