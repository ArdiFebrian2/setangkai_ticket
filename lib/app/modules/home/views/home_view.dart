import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/service_icon.dart';
import '../widgets/section_title.dart';
import '../widgets/list_text.dart';
import '../widgets/cara_pesan_step.dart';
import '../widgets/bantuan_section.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        automaticallyImplyLeading: false, // Hilangkan tombol default back
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
              'Selamat Pagi Ardi!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/profile');
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child: Icon(
                  Icons.person,
                  color: primary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Banner
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CarouselSlider(
                items: [
                  Image.asset('assets/images/bus1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/bus2.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/bus3.jpg', fit: BoxFit.cover),
                ],
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Service Buttons
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ServiceIcon(
                      icon: Icons.directions_bus, label: "Angkutan\nUmum"),
                  ServiceIcon(
                      icon: Icons.local_shipping, label: "Kirim\nPaket"),
                  ServiceIcon(
                      icon: Icons.directions_bus_filled,
                      label: "Sewa Bus\nPariwisata"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Jurusan Bus
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: const SectionTitle(title: "Jurusan Bus"),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: const ListText(items: [
                "Lintau - Padang",
                "Padang - Lintau",
                "Lintau - Pekanbaru - Perawang",
                "Perawang - Pekanbaru - Lintau",
              ]),
            ),

            // Jadwal Keberangkatan
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: const SectionTitle(title: "Jadwal Keberangkatan"),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: const ListText(items: [
                "06.00 WIB",
                "08.00 WIB",
                "10.00 WIB",
                "11.00 WIB",
                "14.00 WIB",
                "16.00 WIB",
                "18.00 WIB",
              ]),
            ),

            // Input Nama dan Telepon
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Nama Penumpang",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Nomor Telepon",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Tombol Pesan Tiket
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar("Anda belum mengisi data penumpang", "");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondary,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Pesan Tiket",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Bagian Cara Pesan
            const CaraPesanStep(),
            const BantuanSection(),
          ],
        ),
      ),
    );
  }
}
