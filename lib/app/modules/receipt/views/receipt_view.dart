
import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:cashe_register/app/constans/app_text.dart';
import 'package:cashe_register/app/constans/app_text_styles.dart';
// import 'package:cashe_register/app/modules/categories/views/english_category_view.dart';
import 'package:cashe_register/app/modules/home/controllers/home_controller.dart';
import 'package:cashe_register/app/modules/receipt/controllers/receipt_controller.dart';
import 'package:cashe_register/app/modules/receipt/widgets/vertical_divider_widget.dart';
import 'package:cashe_register/app/utils/categ_list.dart';
import 'package:cashe_register/app/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReceiptView extends StatefulWidget {
  const ReceiptView({super.key});

  @override
  State<ReceiptView> createState() => _ReceiptViewState();
}

class _ReceiptViewState extends State<ReceiptView> {
  final HomeController _homeController = Get.put(HomeController());

  final ReceiptController _receiptController = Get.put(ReceiptController());
  bool circul = false;
  void _showDialog(Widget? child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 300,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(
              text: AppText.receipt.toUpperCase(),
              child: IconButton(
                onPressed: () {
                  _homeController.navigateToHomeView(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 22,
                  color: AppColors.white,
                ),
              ),
            )),
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Form(
                key: _receiptController.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 36,
                  ),
                  child: Center(
                    child: Container(
                      width: sizeWidth * 0.9,
                      height: sizeHeight * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.grey,
                            blurRadius: 6.5,
                            offset: Offset(0.5, 0.5), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(AppText.kvi.toUpperCase(),
                              style: AppTextStyle.S16W700FGen),
                          SizedBox(
                            width: sizeWidth * 0.85,
                            height: sizeHeight * 0.18,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Obx(() => DropdownButton(
                                      iconSize: 40,
                                      iconEnabledColor: Colors.red,
                                      iconDisabledColor: Colors.black,
                                      dropdownColor: Colors.yellow.shade400,
                                      disabledHint: const Text('*'),
                                      value:
                                          _receiptController.mainCatValue.value,
                                      items: mainCoursName
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        _receiptController
                                            .selectedMainCateg(value);
                                      },
                                    )),
                                const VerticalDividerWidget(),
                                Obx(() => DropdownButton(
                                      iconSize: 40,
                                      iconEnabledColor: Colors.red,
                                      iconDisabledColor: Colors.black,
                                      dropdownColor: Colors.yellow.shade400,
                                      disabledHint: const Text('~'),
                                      value: _receiptController
                                          .subCategValue.value,
                                      items: _receiptController.subCategList
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        _receiptController.subCategValue.value =
                                            value!;
                                      },
                                    )),
                                const VerticalDividerWidget(),
                                Obx(() => DropdownButton(
                                      iconSize: 40,
                                      iconEnabledColor: Colors.red,
                                      iconDisabledColor: Colors.black,
                                      dropdownColor: Colors.yellow.shade400,
                                      disabledHint: const Text('~'),
                                      value: _receiptController
                                          .lvlCategValue.value,
                                      items: selectCoursLevel
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        _receiptController.lvlCategValue.value =
                                            value!;
                                      },
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_receiptController.formattedTime,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.w700S16),
                                const SizedBox(
                                  height: 20,
                                  width: 20,
                                ),
                                Text(_receiptController.formattedDate,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyle.w700S16),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller:
                                  _receiptController.firstNameController,
                              decoration: InputDecoration(
                                fillColor: AppColors.whiteF5,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteF5, width: 2.0),
                                ),
                                labelText: AppText.name,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Пожалуйста напишите Имя ученика';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 26,
                            ),
                            child: TextFormField(
                              controller: _receiptController.amountController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.whiteF5,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteF5, width: 2.0),
                                ),
                                labelText: AppText.price,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Пожалуйста напишите сумму';
                                }
                                return null;
                              },
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                _receiptController.uploadProduct();
                                // _receiptController.add();
                              },
                              // circul == true
                              //     CircularProgressIndicator(
                              //         color: Colors.black,
                              //       )
                              //     :
                              child: _receiptController.processing.value == true
                                  ? const CircularProgressIndicator(
                                      color: Colors.black,
                                    )
                                  : Container(
                                      height: sizeHeight * 0.065,
                                      width: sizeWidth * 0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: AppColors.green50,
                                      ),
                                      child: Center(
                                        child: Text(
                                            AppText.payment.toUpperCase(),
                                            style:
                                                AppTextStyle.whiteS16W700FGen),
                                      ),
                                    )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ReceiptView receiptView = const ReceiptView();

                                  // CupertinoButton(
                                  //   padding: EdgeInsets.zero,
                                  //   onPressed: () {
                                  //     _showDialog(
                                  //       CupertinoPicker(
                                  //         magnification: 1.22,
                                  //         squeeze: 1.2,
                                  //         useMagnifier: true,
                                  //         itemExtent: _receiptController
                                  //             .subCategValue.value as double,
                                  //         onSelectedItemChanged:
                                  //             (int selectedItem) {
                                  //           setState(() {
                                  //             _receiptController
                                  //                 .selectCoursLevel
                                  //                 .value = selectedItem;
                                  //           });
                                  //         },
                                  //         children: List<Widget>.generate(
                                  //             selectCoursLevel.length,
                                  //             (int index) {
                                  //           return Center(
                                  //             child: Text(
                                  //               selectCoursLevel[index],
                                  //             ),
                                  //           );
                                  //         }),
                                  //       ),
                                  //     );
                                  //   },
                                  //   child: Text(
                                  //     selectCoursLevel[_receiptController
                                  //         .selectCoursLevel.value],
                                  //     style: const TextStyle(
                                  //       fontSize: 22.0,
                                  //     ),
                                  //   ),
                                  // ),