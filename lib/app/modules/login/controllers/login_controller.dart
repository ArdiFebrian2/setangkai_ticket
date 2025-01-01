import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final box = GetStorage();

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Ambil data pengguna dari local storage
    final user = box.read<Map<String, dynamic>>('user');

    // Validasi input dengan data pengguna
    if (user != null &&
        user['email'] == email &&
        user['password'] == password) {
      // Simpan status login ke local storage
      box.write('isLoggedIn', true);
      box.write('userEmail', email);

      // Navigasi ke halaman utama
      Get.toNamed('/main_navigation');
    } else {
      Get.snackbar(
        'Login Gagal',
        'Email atau password salah',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void logout() {
    box.remove('isLoggedIn');
    box.remove('userEmail');
    Get.offAllNamed('/login');
  }
}
