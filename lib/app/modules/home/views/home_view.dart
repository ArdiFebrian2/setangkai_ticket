import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/home_controller.dart';
import '../widgets/cara_pesan_step.dart';
import '../widgets/bantuan_section.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GetStorage storage = GetStorage();
    final user = storage.read('user') ?? {'username': 'Pengguna'};
    final username = user['username'];

    // Pastikan HomeController diinisialisasi
    Get.lazyPut(() => HomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primary, primary.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Hallo, $username!',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section with auto-play
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 160,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: 3, // Three banners
                    itemBuilder: (context, index) {
                      final bannerImages = [
                        'assets/images/banner3.jpg',
                        'assets/images/banner2.jpg',
                        'assets/images/banner1.jpg',
                      ];
                      return Image.asset(
                        bannerImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                    onPageChanged: (index) {
                      controller.currentPage.value = index;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Step Indicator (dots)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3, // Number of banners
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: controller.currentPage.value == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentPage.value == index
                              ? secondary
                              : Colors.grey,
                        ),
                      ),
                    ),
                  )),
            ),
            const SizedBox(height: 10),

            // Service Buttons
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/form-bus');
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.directions_bus,
                                  size: 30, color: primary),
                              const SizedBox(height: 5),
                              const Text(
                                "Angkutan\nUmum",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed('/form-kirimpaket');
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 5),
                              Image.asset(
                                'assets/images/voucher.png', // Ganti dengan path gambar Anda
                                width: 35,
                                height: 35,
                                // Menyesuaikan ukuran gambar
                              ),
                              const Text(
                                "Voucher\nSetangkai",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/form-kirimpaket');
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.local_shipping,
                                  size: 30, color: primary),
                              const SizedBox(height: 5),
                              const Text(
                                "Kirim\nPaket",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const CaraPesanStep(),
            const BantuanSection(),
          ],
        ),
      ),
    );
  }
}
