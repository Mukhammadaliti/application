
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

  var formattedTime = DateFormat('HH:mm').format(DateTime.now());
  var formattedDate = DateFormat('dd/ MM  /y').format(DateTime.now());

  Rx<String> mainCatValue = '~'.obs;
  Rx<String> subCategValue = '~'.obs;
  RxList<String> subCategList = <String>[].obs;
  Rx<String> lvlCategValue = "~".obs;

  Rx<int> index = 1.obs;
  Rx<bool> processing = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final amountController = TextEditingController();

  add() {
    if (index.value == index.value) {
      return index.value ++;
    }
  }

  Future<void> uploadReceipt() async {
    if (mainCatValue.value != '*' ||
        subCategValue != '~' ||
        lvlCategValue.value != "~") {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        processing.value = true;
      }
    }
  }

  void uploadProduct() async {
    await uploadReceipt().whenComplete(() => addInvoice());
    mainCatValue.value = '~';
    subCategValue.value = '~';
    lvlCategValue.value = '~';
    formKey.currentState!.reset();

    processing.value = false;
  }

  void showSnackBar() {
    const GetSnackBar(
      message: "You do not selected categories",
      duration: Duration(
        seconds: 5,
      ),
    );
  }
    RxString uid =  const Uuid().v4().obs;

  void addInvoice() async {
    String formattedData = DateFormat('dd-MM-yyyy').format(DateTime.now());
    String formattedTime = DateFormat('HH:mm').format(DateTime.now());
    CollectionReference receipt =
        FirebaseFirestore.instance.collection('receipt');
    await receipt.doc(uid.value).set({
      "course": mainCatValue.value,
      "lvl": lvlCategValue.value,
      "teacher": subCategValue.value,
      "firstName": firstNameController.text,
      "amount": amountController.text,
      "invoiceNumber": add(),
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
