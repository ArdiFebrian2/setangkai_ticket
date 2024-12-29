import 'package:get/get.dart';

class InfoController extends GetxController {
  /// State untuk menentukan apakah bagian "Peraturan Calon Penumpang" ditampilkan atau disembunyikan
  RxBool showPassengerRules = false.obs;

  /// State untuk menentukan apakah bagian "Peraturan Pengiriman Paket" ditampilkan atau disembunyikan
  RxBool showPackageRules = false.obs;

  /// State untuk menentukan apakah bagian "Jadwal Keberangkatan" ditampilkan atau disembunyikan
  RxBool showSchedule = false.obs;
  RxBool showOthers = false.obs;
  RxBool showAddress = false.obs;

  /// Fungsi untuk toggle semua bagian sekaligus jika diperlukan (opsional tambahan)
  void toggleAll() {
    showPassengerRules.toggle();
    showPackageRules.toggle();
    showSchedule.toggle();
  }
}
