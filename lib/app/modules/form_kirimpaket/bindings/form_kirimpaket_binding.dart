import 'package:get/get.dart';
import '../controllers/form_kirimpaket_controller.dart';

class FormKirimpaketBinding extends Bindings {
  @override
  void dependencies() {
    // Pastikan controller diinisialisasi menggunakan Get.put
    Get.put<FormKirimpaketController>(FormKirimpaketController());
  }
}
