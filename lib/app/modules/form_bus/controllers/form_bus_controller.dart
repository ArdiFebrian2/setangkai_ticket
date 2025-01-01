import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormBusController extends GetxController {
  // Variabel untuk menyimpan data pilihan
  RxString selectedTime = '08:00 AM'.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  RxString selectedPaymentMethod = ''.obs;

  // Variabel untuk titik keberangkatan dan tujuan
  RxString selectedDeparturePoint = ''.obs;
  RxString selectedDestination = ''.obs;
  TextEditingController passengerNameController = TextEditingController();

  // Variabel harga
  RxInt ticketPrice = 0.obs;

  // Formatter untuk harga
  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 0);

  // Pilihan waktu keberangkatan
  final List<String> departureTimes = [
    '08:00 AM',
    '10:00 AM',
    '12:00 PM',
    '02:00 PM',
    '04:00 PM',
  ];

  // Pilihan metode pembayaran dengan logo
  final List<Map<String, String>> paymentMethods = [
    {
      'name': 'Shopeepay',
      'logo': 'assets/images/shopee.png',
    },
    {
      'name': 'Gopay',
      'logo': 'assets/images/gopay.png',
    },
    {
      'name': 'OVO',
      'logo': 'assets/images/ovo.png',
    },
    {
      'name': 'Dana',
      'logo': 'assets/images/dana.png',
    },
  ];

  // Daftar titik keberangkatan dan tujuan
  final List<String> departurePoints = [
    'Lintau',
    'Batusangkar',
    'Padang Panjang',
    'Lubuk Alung',
    'Padang',
  ];

  final List<String> destinations = [
    'Lintau',
    'Batusangkar',
    'Padang Panjang',
    'Lubuk Alung',
    'Padang',
  ];

  // Data harga berdasarkan kombinasi keberangkatan dan tujuan
  final Map<String, int> priceData = {
    'Lintau-Padang': 45000,
    'Lintau-Batusangkar': 25000,
    'Lintau-Lubuk Alung': 40000,
    'Lintau-Padang Panjang': 30000,
    'Padang Panjang-Lintau': 30000,
    'Padang Panjang-Batusangkar': 20000,
    'Padang Panjang-Lubuk Alung': 20000,
    'Padang Panjang-Padang': 35000,
    'Padang-Lubuk Alung': 20000,
    'Padang-Batusangkar': 25000,
    'Padang-Padang Panjang': 35000,
    'Lubuk Alung-Padang': 20000,
    'Lubuk Alung-Padang Panjang': 25000,
    'Lubuk Alung-Batusangkar': 25000,
    'Lubuk Alung-Lintau': 40000,
    'Batusangkar-Padang': 25000,
    'Batusangkar-Lintau': 25000,
    'Padang-Lintau': 45000,
  };

  // Getter untuk format tanggal yang dipilih
  String get formattedSelectedDate {
    return selectedDate.value == null
        ? 'Pilih Tanggal'
        : DateFormat('dd MMMM yyyy').format(selectedDate.value!);
  }

  // Getter untuk format harga
  String get formattedTicketPrice {
    return currencyFormatter.format(ticketPrice.value);
  }

  // Fungsi untuk memperbarui waktu keberangkatan
  void updateDepartureTime(String? time) {
    if (time != null) {
      selectedTime.value = time;
    }
  }

  // Fungsi untuk memperbarui tanggal keberangkatan
  void updateDepartureDate(DateTime date) {
    selectedDate.value = date;
  }

  // Fungsi untuk memperbarui metode pembayaran
  void updatePaymentMethod(String? method) {
    if (method != null) {
      selectedPaymentMethod.value = method;
    }
  }

  // Fungsi untuk memperbarui titik keberangkatan
  void updateDeparturePoint(String? point) {
    if (point != null) {
      selectedDeparturePoint.value = point;
      calculatePrice(); // Hitung harga setiap kali keberangkatan diperbarui
    }
  }

  // Fungsi untuk memperbarui tujuan
  void updateDestination(String? destination) {
    if (destination != null) {
      selectedDestination.value = destination;
      calculatePrice(); // Hitung harga setiap kali tujuan diperbarui
    }
  }

  // Fungsi untuk menghitung harga
  void calculatePrice() {
    String route =
        '${selectedDeparturePoint.value}-${selectedDestination.value}';
    ticketPrice.value = priceData[route] ?? 0;
  }

  // Fungsi untuk mengonfirmasi pembayaran
  void confirmPayment() {
    print('Pembayaran menggunakan metode: ${selectedPaymentMethod.value}');
    print('Total harga tiket: ${formattedTicketPrice}');
  }
}
