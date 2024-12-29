import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Riwayat Order"),
        centerTitle: true,
        // automaticallyImplyLeading: true,
      ),
      body: Obx(() {
        if (controller.orders.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/notempty.png',
                  width: 300,
                  height: 300,
                ),
                const Text(
                  "Belum ada riwayat pesanan.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            order['passengerName'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          order['departureDate'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 20),
                    _buildDetailRow(
                      icon: Icons.place_outlined,
                      label: "Keberangkatan",
                      value: order['departurePoint'],
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      icon: Icons.flag_outlined,
                      label: "Tujuan",
                      value: order['destination'],
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      icon: Icons.access_time_outlined,
                      label: "Waktu",
                      value: "${order['departureTime']}",
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      icon: Icons.price_change,
                      label: "Harga",
                      value: "Rp ${order['tiketPrice']}",
                    ),
                    const SizedBox(height: 8),
                    _buildDetailRow(
                      icon: Icons.payment_outlined,
                      label: "Metode Pembayaran",
                      value: order['paymentMethod'],
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () => controller.deleteOrder(index),
                        icon: const Icon(Icons.delete_outlined,
                            color: Colors.red),
                        label: const Text(
                          "Hapus",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: secondary),
            const SizedBox(width: 8),
            Text(
              "$label: ",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
