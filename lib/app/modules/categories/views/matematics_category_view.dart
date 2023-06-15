import 'package:cashe_register/app/constans/app_colors.dart';
import 'package:cashe_register/app/constans/app_text.dart';
import 'package:cashe_register/app/constans/app_text_styles.dart';
import 'package:cashe_register/app/modules/categories/views/sub_category_view.dart';
import 'package:cashe_register/app/modules/categories/widgets/search_widget.dart';
import 'package:cashe_register/app/modules/home/controllers/home_controller.dart';
import 'package:cashe_register/app/modules/receipt/controllers/receipt_controller.dart';
import 'package:cashe_register/app/utils/categ_list.dart';
import 'package:cashe_register/app/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MatematicsCategory extends StatelessWidget {
  MatematicsCategory({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());
  final _receiptController = Get.put(ReceiptController());

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('receipt');
    // .orderBy("course", descending: true) as CollectionReference<Object?>;

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(_receiptController.uid.value).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text(
            "Something went wrong",
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text(
            "Document does not exist",
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: CustomAppBar(
                  text: AppText.mathText,
                  child: IconButton(
                      onPressed: () {
                        _homeController.navigateToHomeView(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.whiteF5,
                      )),
                )),
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SearchWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.99,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: GridView.count(
                            mainAxisSpacing: 70,
                            crossAxisSpacing: 15,
                            crossAxisCount: 2,
                            children: List.generate(math.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubCategoryView(
                                        subCategName: math[index],
                                        mainCategName: 'Math',
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Text(flutter[index]),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.09,
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                color: AppColors.grey,
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(
                                                  0,
                                                  3,
                                                ))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10.06),
                                          color: AppColors.whiteFC),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Цена - ${data['amount']} ',
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyle
                                                      .black15wBlodFgen),
                                              Text(
                                                " ${data['date']}",
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle.green16w700,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("${data['firstName']}",
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyle
                                                      .black22wBold),
                                              Text("${data['invoiceNumber']}",
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyle
                                                      .greyOA16wBold),
                                              // Text(
                                              //   "${data['time']}",
                                              //   textAlign: TextAlign.center,
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
