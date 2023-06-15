import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:flutter/material.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({
    Key? key,
    required this.subCategName,
    required this.mainCategName,
  }) : super(key: key);
  final String subCategName;
  final String mainCategName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
            )),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Center(
            child: Text('English',
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: 'Acme',
                  fontSize: 28,
                  letterSpacing: 1.5,
                ))),
      ),
      body: Center(
        child: Text(mainCategName),
      ),
    );
  }
}
