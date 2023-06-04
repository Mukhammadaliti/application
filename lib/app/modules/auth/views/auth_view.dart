// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:cashe_register/app/modules/auth/controllers/auth_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends GetView<AuthController> {
  AuthView({Key? key}) : super(key: key);

  final _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: _controller.scaffoldKey,
        child: Scaffold(
          body: SafeArea(
            child: Form(
              key: _controller.formKey,
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
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please fill your email';
                        } else if (value.isValidEmail() == false) {
                          return 'Not Valid';
                        } else if (value.isValidEmail() == true) {
                          return null;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _controller.eMail.value;
                      },
                      controller: _controller.emailConroller,
                      decoration: InputDecoration(
                        hintText: 'Please enter your gmail',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        labelText: 'Логин',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Obx(() => TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please fill your password";
                            } else {
                              return null;
                            }
                          },
                          obscureText: _controller.isVisible.value,
                          onChanged: (value) {
                            _controller.password.value = value;
                            log("password ====> ${_controller.password}");
                          },
                          controller: _controller.passwordConroller,
                          decoration: InputDecoration(
                            hintText: 'Please enter your password',
                            suffixIcon: IconButton(
                              icon: Icon(_controller.isVisible.value == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                _controller.isVisible.value =
                                    !_controller.isVisible.value;
                              },
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)),
                            labelText: 'Пароль',
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  InkWell(
                    onTap: () {
                      AuthController.instance.login(
                        _controller.emailConroller.text.trim(),
                        _controller.passwordConroller.text.trim(),
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
