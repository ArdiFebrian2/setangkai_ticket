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
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Yogyakarta',
  ];

  final List<String> destinations = [
    'Bandung',
    'Surabaya',
    'Yogyakarta',
    'Bali',
  ];

  // Getter untuk format tanggal yang dipilih
  String get formattedSelectedDate {
    return selectedDate.value == null
        ? 'Pilih Tanggal'
        : DateFormat('dd MMMM yyyy').format(selectedDate.value!);
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
    }
  }

  // Fungsi untuk memperbarui tujuan
  void updateDestination(String? destination) {
    if (destination != null) {
      selectedDestination.value = destination;
    }
  }

  // Fungsi untuk mengonfirmasi pembayaran
  void confirmPayment() {
    print('Pembayaran menggunakan metode: ${selectedPaymentMethod.value}');
  }
}