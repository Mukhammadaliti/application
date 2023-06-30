import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:flutter/material.dart';

class SnackBarWidget {
  static void snackBar(String text, var scaffoldKey) {
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        backgroundColor: AppColors.yellow,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}