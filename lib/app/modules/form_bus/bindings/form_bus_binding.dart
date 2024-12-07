import 'package:get/get.dart';

import '../controllers/form_bus_controller.dart';

class FormBusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormBusController>(
      () => FormBusController(),
    );
  }
}
