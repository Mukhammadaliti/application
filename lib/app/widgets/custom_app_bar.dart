import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:cashe_register/app/constans/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.child,
    this.text,
  });
  final Widget? child;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: child,
      backgroundColor: AppColors.black53,
      centerTitle: true,
      title: Text(
        text!.toUpperCase(),
        style: AppTextStyle.whiteS24FGen,
      ),
    );
  }
}
