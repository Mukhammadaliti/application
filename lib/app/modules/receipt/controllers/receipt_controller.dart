import 'dart:developer';
import 'dart:io';

import 'package:cashe_register/app/constans/app_text.dart';
import 'package:cashe_register/app/model/invoice_model.dart';
import 'package:cashe_register/app/modules/categories/views/english_category_view.dart';
import 'package:cashe_register/app/modules/home/widgets/custom_snack_bar.dart';
import 'package:cashe_register/app/utils/categ_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cashe_register/app/utils/categ_list.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class ReceiptController extends GetxController {
  final FirebaseStorage storage;
  final Reference storageRef;

  ReceiptController()
      : storage = FirebaseStorage.instance,
        storageRef = FirebaseStorage.instance.ref().child('texts');
  Rx<String> mainCatValue = '*'.obs;

  Rx<String> subCategValue = '~'.obs;

  RxList<String> subCategList = <String>[].obs;

  RxInt selectCoursName = 0.obs;

  RxInt selectCoursLevel = 0.obs;

  RxInt selectCoursTeach = 0.obs;

  RxDouble kItemExtent = 0.0.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();

  final amountController = TextEditingController();

  void showSnackBar() {
    const GetSnackBar(
      message: "You do not selected categories",
      duration: Duration(
        seconds: 5,
      ),
    );
  }
  // String invoiceNumber = "${invoices.length + 1}";

// List<String> selectedCategories
  List<Invoice> invoices = [];

  void addInvoice() async {
    String formattedData = DateFormat('dd-MM-yyyy').format(DateTime.now());
    String formattedTime = DateFormat('HH:mm').format(DateTime.now());

    CollectionReference receipt =
        FirebaseFirestore.instance.collection('receipt');
    var uid = Uuid().v4();
    invoices.add(Invoice(
      firstName: firstNameController.text,
      amount: amountController.text,
      invoiceNumber: '${invoices.length + 1}',
      date: formattedData,
      time: formattedTime,
      sId: FirebaseAuth.instance.currentUser!.uid,
    ));
    await receipt.doc(uid).set({
      "firstName": firstNameController.text,
      "amount": amountController.text,
      "invoiceNumber": "${invoices.length + 1}",
      "date": formattedData,
      "time": formattedTime,
      "sId": FirebaseAuth.instance.currentUser!.uid,
    });
  }

  void selectedMainCateg(String? value) {
    if (value == 'select category') {
      subCategList.value = [];
    } else if (value == 'English') {
      subCategList.value = english;
    } else if (value == 'Flutter') {
      subCategList.value = flutter;
    } else if (value == 'Front End') {
      subCategList.value = frontend;
    } else if (value == 'Back End') {
      subCategList.value = backEnd;
    } else if (value == 'Math') {
      subCategList.value = math;
    } else if (value == 'ORT') {
      subCategList.value = ort;
    } else if (value == 'Russian') {
      subCategList.value = rus;
    }

    mainCatValue.value = value!;
    subCategValue.value = '~';
  }
}
