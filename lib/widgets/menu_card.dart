import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bebas_deh/controllers/payment_controller.dart';
import '../models/kopi.model.dart';
import '../controllers/kopi.controller.dart';

class MenuCard extends StatelessWidget {
  final Kopi kopi;

  MenuCard({super.key, required this.kopi});
  
  final KopiController kopiController = Get.find();
  final PaymentController paymentController = Get.put(PaymentController());
  final KopiController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(
          kopi.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          kopi.harga.toString(),
          style: const TextStyle(color: Colors.brown),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.green),
              onPressed: () {
                paymentController.buatPesanan(kopi.harga, kopi.nama);
              },
            ),
            // UPDATE
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Get.toNamed('/menu-form', arguments: kopi);
              },
            ),
            // DELETE
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                Get.defaultDialog(
                  title: "Hapus Kopi",
                  middleText: "Yakin ingin menghapus kopi ini?",
                  textCancel: "Batal",
                  textConfirm: "Hapus",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    controller.hapusKopi(kopi.id);
                    Get.back();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
