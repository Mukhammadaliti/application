// ignore_for_file: must_be_immutable

import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:cashe_register/app/modules/auth/controllers/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthController> {
  AuthView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  var emailConroller = TextEditingController();
  var passwordConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: scaffoldKey,
        child: Scaffold(
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: 280.0,
                    width: 900,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(105.0),
                            bottomRight: Radius.circular(105.0))),
                    child: Center(
                      child: Image.asset(
                        "assets/images/photo.png",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: emailConroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        labelText: 'Логин',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: passwordConroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        labelText: 'Пароль',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  InkWell(
                    onTap: () {
                      AuthController.instance.login(
                        emailConroller.text.trim(),
                        passwordConroller.text.trim(),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.black53,
                      ),
                      child: const Center(
                        child: Text(
                          'Продолжить',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ));
  }
}
