import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main_navigation/views/main_navigation_view.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  // Fungsi untuk mengatur email
  void setEmail(String value) {
    email.value = value;
  }

  // Fungsi untuk mengatur password
  void setPassword(String value) {
    password.value = value;
  }

  // Fungsi untuk melakukan proses login
  void login() {
    if (email.value.isNotEmpty && password.value.isNotEmpty) {
      // Simulasi login berhasil
      Get.lazyPut(() => MainNavigationView());
    } else {
      // Menampilkan pesan kesalahan jika ada field yang kosong
      Get.snackbar(
        'Error',
        'Masukkan data Anda terlebih dahulu.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
