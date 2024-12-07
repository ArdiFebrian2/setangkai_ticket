import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:setangkai_ticket/app/shared/theme.dart';

class FormKirimpaketView extends StatelessWidget {
  const FormKirimpaketView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _namaPengirimController =
        TextEditingController();
    final TextEditingController _alamatPengirimController =
        TextEditingController();
    final TextEditingController _namaPenerimaController =
        TextEditingController();
    final TextEditingController _alamatPenerimaController =
        TextEditingController();
    final TextEditingController _jenisPaketController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Kirim Paket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Nama Pengirim
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: const [
                    Icon(Icons.person),
                    SizedBox(width: 8),
                    Text("Nama Pengirim"),
                  ],
                ),
              ),
              TextFormField(
                controller: _namaPengirimController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pengirim',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Pengirim harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Alamat Pengirim
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: const [
                    Icon(Icons.home),
                    SizedBox(width: 8),
                    Text("Alamat Pengirim"),
                  ],
                ),
              ),
              TextFormField(
                controller: _alamatPengirimController,
                decoration: const InputDecoration(
                  labelText: 'Alamat Pengirim',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat Pengirim harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Nama Penerima
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: const [
                    Icon(Icons.person_outline),
                    SizedBox(width: 8),
                    Text("Nama Penerima"),
                  ],
                ),
              ),
              TextFormField(
                controller: _namaPenerimaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Penerima',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Penerima harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Alamat Penerima
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: const [
                    Icon(Icons.location_on),
                    SizedBox(width: 8),
                    Text("Alamat Penerima"),
                  ],
                ),
              ),
              TextFormField(
                controller: _alamatPenerimaController,
                decoration: const InputDecoration(
                  labelText: 'Alamat Penerima',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat Penerima harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Jenis Paket
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: const [
                    Icon(Icons.archive),
                    SizedBox(width: 8),
                    Text("Jenis Paket"),
                  ],
                ),
              ),
              TextFormField(
                controller: _jenisPaketController,
                decoration: const InputDecoration(
                  labelText: 'Jenis Paket',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis Paket harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Tombol Kirim Paket
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Jika form valid, kirim data
                      Get.snackbar(
                        'Sukses',
                        'Paket berhasil dikirim',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      // Navigasi ke halaman lain setelah mengirim paket
                      // Get.toNamed('/some_other_page');
                    }
                  },
                  child: const Text(
                    'Kirim Paket',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 16),
                    backgroundColor: secondary, // Menambahkan warna background
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Border radius
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
