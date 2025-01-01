import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';
import '../../order/controllers/order_controller.dart';
import '../../order/views/order_view.dart';
import '../controllers/form_bus_controller.dart';

class FormBusView extends GetView<FormBusController> {
  final FormBusController controller = Get.put(FormBusController());
  final OrderController orderController = Get.put(OrderController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FormBusController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Form Pemesanan Bus"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Nama Penumpang
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: const [
                      Icon(Icons.person, color: secondary),
                      SizedBox(width: 8),
                      Text("Nama Penumpang"),
                    ],
                  ),
                ),
                TextFormField(
                  controller: controller.passengerNameController,
                  decoration: InputDecoration(
                    hintText: "Masukkan Nama Penumpang",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Penumpang tidak boleh kosong';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                // Pilih Titik Keberangkatan
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, color: secondary),
                      SizedBox(width: 8),
                      Text("Titik Keberangkatan"),
                    ],
                  ),
                ),
                Obx(() => DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedDeparturePoint.value.isEmpty
                          ? null
                          : controller.selectedDeparturePoint.value,
                      hint: const Text("Pilih Titik Keberangkatan"),
                      items: controller.departurePoints
                          .map((point) => DropdownMenuItem(
                                value: point,
                                child: Text(point),
                              ))
                          .toList(),
                      onChanged: controller.updateDeparturePoint,
                    )),
                Obx(() {
                  if (controller.selectedDeparturePoint.value.isEmpty) {
                    return const Text(
                      'Titik Keberangkatan harus dipilih',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    );
                  }
                  return const SizedBox.shrink();
                }),

                const SizedBox(height: 10),

                // Pilih Tujuan
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.place_outlined,
                        color: secondary,
                      ),
                      SizedBox(width: 8),
                      Text("Tujuan"),
                    ],
                  ),
                ),
                Obx(() => DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedDestination.value.isEmpty
                          ? null
                          : controller.selectedDestination.value,
                      hint: const Text("Pilih Tujuan"),
                      items: controller.destinations
                          .map((destination) => DropdownMenuItem(
                                value: destination,
                                child: Text(destination),
                              ))
                          .toList(),
                      onChanged: controller.updateDestination,
                    )),
                Obx(() {
                  if (controller.selectedDestination.value.isEmpty) {
                    return const Text(
                      'Tujuan harus dipilih',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    );
                  }
                  return const SizedBox.shrink();
                }),

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.attach_money, color: secondary),
                      SizedBox(width: 8),
                      Text("Harga Tiket"),
                    ],
                  ),
                ),
                Obx(() {
                  return Text(
                    controller.ticketPrice.value > 0
                        ? 'Rp ${controller.ticketPrice.value}'
                        : 'Pilih keberangkatan dan tujuan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: controller.ticketPrice.value > 0
                          ? Colors.black
                          : Colors.red,
                    ),
                  );
                }),

                // Pilih Tanggal
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.calendar_today,
                        color: secondary,
                      ),
                      SizedBox(width: 8),
                      Text("Tanggal Keberangkatan"),
                    ],
                  ),
                ),
                Obx(() => ListTile(
                      title: Text(controller.formattedSelectedDate),
                      trailing: const Icon(
                        Icons.calendar_today,
                        color: secondary,
                      ),
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (selectedDate != null) {
                          controller.updateDepartureDate(selectedDate);
                        }
                      },
                    )),
                Obx(() {
                  if (controller.formattedSelectedDate.isEmpty) {
                    return const Text(
                      'Tanggal Keberangkatan harus dipilih',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    );
                  }
                  return const SizedBox.shrink();
                }),

                const SizedBox(height: 10),

                // Pilih Waktu Keberangkatan
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.access_time,
                        color: secondary,
                      ),
                      SizedBox(width: 8),
                      Text("Waktu Keberangkatan"),
                    ],
                  ),
                ),
                Obx(() => DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedTime.value,
                      items: controller.departureTimes
                          .map((time) => DropdownMenuItem(
                                value: time,
                                child: Text(time),
                              ))
                          .toList(),
                      onChanged: controller.updateDepartureTime,
                    )),
                Obx(() {
                  if (controller.selectedTime.value.isEmpty) {
                    return const Text(
                      'Waktu Keberangkatan harus dipilih',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    );
                  }
                  return const SizedBox.shrink();
                }),

                const SizedBox(height: 16),

                // Pilih Metode Pembayaran
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.payment,
                        color: secondary,
                      ),
                      SizedBox(width: 8),
                      Text("Metode Pembayaran"),
                    ],
                  ),
                ),
                Obx(() => Column(
                      children: controller.paymentMethods.map((method) {
                        return ListTile(
                          leading: Image.asset(
                            method['logo']!,
                            width: 40,
                            height: 40,
                          ),
                          title: Text(method['name']!),
                          trailing: Radio<String>(
                            value: method['name']!,
                            groupValue: controller.selectedPaymentMethod.value,
                            onChanged: controller.updatePaymentMethod,
                          ),
                        );
                      }).toList(),
                    )),
                Obx(() {
                  if (controller.selectedPaymentMethod.value.isEmpty) {
                    return const Text(
                      'Metode Pembayaran harus dipilih',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    );
                  }
                  return const SizedBox.shrink();
                }),

                const SizedBox(height: 15),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final order = {
                          'passengerName':
                              controller.passengerNameController.text,
                          'departurePoint':
                              controller.selectedDeparturePoint.value,
                          'destination': controller.selectedDestination.value,
                          'departureDate': controller.formattedSelectedDate,
                          'tiketPrice': controller.ticketPrice.value,
                          'departureTime': controller.selectedTime.value,
                          'paymentMethod':
                              controller.selectedPaymentMethod.value,
                        };

                        Get.find<OrderController>().addOrder(order);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/confirm.png',
                                      width: 200,
                                      height: 200,
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Tiket Berhasil dipesan!',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Tunggu Konfirmasi dari Supir',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 24),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Menutup dialog
                                        Get.to(() => OrderView());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: secondary,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 12,
                                        ),
                                      ),
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      'Konfirmasi',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 120),
                      textStyle: const TextStyle(fontSize: 16),
                      backgroundColor: secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
