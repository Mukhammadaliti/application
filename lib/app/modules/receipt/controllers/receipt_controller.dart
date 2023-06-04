import 'package:cashe_register/app/model/invoice_model.dart';

import 'package:cashe_register/app/utils/categ_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class ReceiptController extends GetxController {
  final FirebaseStorage storage;
  final Reference storageRef;

  ReceiptController()
      : storage = FirebaseStorage.instance,
        storageRef = FirebaseStorage.instance.ref().child('texts');
  Rx<String> mainCatValue = '~'.obs;

  Rx<String> subCategValue = '~'.obs;

  RxList<String> subCategList = <String>[].obs;
  Rx<String> lvlCategValue = "~".obs;

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

  RxInt index = 0.obs;
  void addInvoice() async {
    String formattedData = DateFormat('dd-MM-yyyy').format(DateTime.now());
    String formattedTime = DateFormat('HH:mm').format(DateTime.now());

    CollectionReference receipt =
        FirebaseFirestore.instance.collection('receipt');
    var uid = Uuid().v4();
    // invoices.add(Invoice(
    //   course: mainCatValue.value,
    //   lvl: lvlCategValue.value,
    //   teacher: subCategValue.value,
    //   firstName: firstNameController.text,
    //   amount: amountController.text,
    //   invoiceNumber: '${invoices.length + 1}',
    //   date: formattedData,
    //   time: formattedTime,
    //   sId: FirebaseAuth.instance.currentUser!.uid,
    // ));
    await receipt.doc(uid).set({
      "course": mainCatValue.value,
      "lvl": lvlCategValue.value,
      "teacher": subCategValue.value,
      "firstName": firstNameController.text,
      "amount": amountController.text,
      "invoiceNumber": index.toString().length + 1,
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
    } else if (value == flutter) {
      subCategList.value = selectCoursLevel;
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
    subCategValue.value = "~";
  }
}
