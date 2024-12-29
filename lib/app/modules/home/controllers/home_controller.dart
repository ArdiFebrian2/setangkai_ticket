import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Variabel untuk melacak halaman aktif
  var currentPage = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage.value);

    // Timer untuk auto-play halaman
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (pageController.page != null) {
        int nextPage = pageController.page!.toInt() + 1;
        if (nextPage > 2) nextPage = 0; // Kembali ke halaman pertama
        pageController.animateToPage(nextPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
