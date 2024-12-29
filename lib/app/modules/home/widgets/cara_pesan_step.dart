import 'package:flutter/material.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';

class CaraPesanStep extends StatefulWidget {
  const CaraPesanStep({super.key});

  @override
  State<CaraPesanStep> createState() => _CaraPesanStepState();
}

class _CaraPesanStepState extends State<CaraPesanStep> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  // Data langkah-langkah cara pesan
  final List<Map<String, String>> steps = [
    {
      "step": "1",
      "description":
          "Masukkan Username serta Password akun Anda.\nAtau gunakan akun Google Anda.",
    },
    {
      "step": "2",
      "description":
          "Pilih produk atau layanan yang Anda inginkan dari katalog.",
    },
    {
      "step": "3",
      "description": "Lakukan pembayaran melalui metode yang tersedia.",
    },
    {
      "step": "4",
      "description": "Tunggu konfirmasi pesanan Anda melalui notifikasi.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              "Cara Pesan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              "Berikut petunjuk pemesanan di Setangkai App",
              style: TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150, // Tinggi termasuk indikator
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: steps.length,
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final step = steps[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: secondary, // Warna background
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    step["step"]!,
                                    style: const TextStyle(
                                      color: secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  step["description"]!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // Indikator titik-titik
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(steps.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: _currentPage == index ? 12.0 : 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? secondary : Colors.grey,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
