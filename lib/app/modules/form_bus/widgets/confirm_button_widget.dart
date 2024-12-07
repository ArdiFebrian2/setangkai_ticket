import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';

class ConfirmButtonWidget extends StatelessWidget {
  final String paymentMethod;

  const ConfirmButtonWidget({Key? key, required this.paymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Get.snackbar(
            'Pembayaran Terkonfirmasi',
            'Metode Pembayaran: $paymentMethod',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2),
          );
        },
        child: const Text(
          'Pesan Tiket',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: secondary,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 120),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
