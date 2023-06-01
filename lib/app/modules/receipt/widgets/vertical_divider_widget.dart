import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:flutter/material.dart';

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: AppColors.green50,
      indent: 30,
      endIndent: 30,
      width: 10,
      thickness: 1.5,
    );
  }
}
