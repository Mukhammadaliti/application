import 'package:cashe_register/app/modules/receipt/controllers/receipt_controller.dart';
import 'package:get/get.dart';

class ReceiptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceiptController>(
      () => ReceiptController(),
    );
  }
}
