import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bebas_deh/controllers/kopi.controller.dart';
import 'package:project_bebas_deh/models/kopi.model.dart';

class MenuFormPage extends StatelessWidget {
  MenuFormPage({super.key});

  final KopiController controller = Get.find<KopiController>();

  @override
  Widget build(BuildContext context) {
    final Kopi? kopiArg = Get.arguments as Kopi?;
    controller.initForm(kopiArg);
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(controller.isEditMode.value ? "Edit Kopi" : "Tambah Kopi"),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.namaController,
              decoration: const InputDecoration(labelText: "Nama Kopi"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.hargaController,
              decoration: const InputDecoration(labelText: "Harga"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                controller.simpanData();
              },
              child: Obx(
                () => Text(controller.isEditMode.value ? "Update" : "Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}