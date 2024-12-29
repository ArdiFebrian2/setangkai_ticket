import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  final GetStorage storage = GetStorage();

  // Validasi nama lengkap
  String? validateFullName(String fullName) {
    if (fullName.isEmpty) {
      return 'Nama lengkap tidak boleh kosong';
    }
    return null;
  }

  // Validasi email
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  // Validasi username
  String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'Username tidak boleh kosong';
    }
    if (username.length < 4) {
      return 'Username harus memiliki minimal 4 karakter';
    }
    return null;
  }

  // Validasi password
  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (password.length < 8) {
      return 'Password harus memiliki minimal 8 karakter';
    }
    return null;
  }

  // Fungsi untuk mendaftarkan user
  void registerUser(
      String fullName, String email, String username, String password) {
    // Lakukan validasi untuk setiap input
    final fullNameError = validateFullName(fullName);
    final emailError = validateEmail(email);
    final usernameError = validateUsername(username);
    final passwordError = validatePassword(password);

    // Jika ada error, tampilkan pesan kesalahan
    if (fullNameError != null ||
        emailError != null ||
        usernameError != null ||
        passwordError != null) {
      Get.snackbar(
        'Registrasi Gagal',
        '${fullNameError ?? ''}\n${emailError ?? ''}\n${usernameError ?? ''}\n${passwordError ?? ''}'
            .trim(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    // Simpan data user ke local storage jika validasi berhasil
    storage.write('user', {
      'fullName': fullName,
      'email': email,
      'username': username,
      'password': password,
    });

    // Navigasi ke halaman login
    Get.snackbar(
      'Registrasi Berhasil',
      'Akun Anda berhasil didaftarkan',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.greenAccent,
      colorText: Colors.black,
    );
    Get.toNamed('/login');
  }
}
