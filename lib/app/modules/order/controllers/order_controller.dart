import 'package:get/get.dart';

class OrderController extends GetxController {
  final RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;

  // Menambah pesanan ke daftar
  void addOrder(Map<String, dynamic> order) {
    orders.add(order);
  }

  // Menghapus pesanan berdasarkan index
  void deleteOrder(int index) {
    orders.removeAt(index);
  }
}
