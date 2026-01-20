import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bebas_deh/controllers/kopi.controller.dart';
import 'package:project_bebas_deh/models/kopi.model.dart';

class MenuFormPage extends StatelessWidget {
  MenuFormPage({super.key});

  final KopiController controller = Get.find<KopiController>();

  @override
  Widget build(BuildContext context) {
    final Kopi? kopi = Get.arguments as Kopi?;
    final bool isUpdate = kopi != null;

    final TextEditingController namaController = TextEditingController(
      text: kopi?.nama ?? '',
    );
    final TextEditingController deskripsiController = TextEditingController(
      text: kopi?.deskripsi ?? '',
    );
    // PAGE TAMBAH / EDIT
    return Scaffold(
      appBar: AppBar(
        title: Text(isUpdate ? "Edit Kopi" : "Tambah Kopi"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Nama Kopi"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: deskripsiController,
              decoration: const InputDecoration(labelText: "Deskripsi"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                simpanData(kopi, namaController, deskripsiController, isUpdate);
              },
              child: Text(isUpdate ? "Update" : "Simpan"),
            ),
          ],
        ),
      ),
    );
  }

  // UPDATE
  void simpanData(
    Kopi? kopi,
    TextEditingController namaController,
    TextEditingController deskripsiController,
    bool isUpdate,
  ) {
    final nama = namaController.text.trim();
    final deskripsi = deskripsiController.text.trim();

    if (nama.isEmpty || deskripsi.isEmpty) {
      Get.snackbar("Error", "Semua field wajib diisi");
      return;
    }

    if (isUpdate) {
      controller.updateKopi(
        Kopi(id: kopi!.id, nama: nama, deskripsi: deskripsi),
      );
    } else {
      controller.tambahKopi(nama, deskripsi);
    }

    Get.back();
  }
}
