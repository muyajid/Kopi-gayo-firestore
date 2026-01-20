import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_bebas_deh/models/kopi.model.dart';

class KopiController extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var kopis = <Kopi>[].obs;
  late TextEditingController namaController;
  late TextEditingController hargaController;
  var selectedKopiId = ''.obs; 
  var isEditMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    namaController = TextEditingController();
    hargaController = TextEditingController();
    ambilKopi();
  }

  void initForm(Kopi? kopi) {
    if (kopi != null) {
      isEditMode.value = true;
      selectedKopiId.value = kopi.id;
      namaController.text = kopi.nama;
      hargaController.text = kopi.harga.toString();
    } else {
      isEditMode.value = false;
      selectedKopiId.value = '';
      namaController.clear();
      hargaController.clear();
    }
  }

  void simpanData() {
    final nama = namaController.text.trim();
    final harga = hargaController.text.trim();
    if (nama.isEmpty || harga.isEmpty) {
      Get.snackbar(
        "Error", 
        "Semua field wajib diisi",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (isEditMode.value) {
      updateKopi(
        Kopi(id: selectedKopiId.value, nama: nama, harga: int.parse(harga)),
      );
    } else {
      tambahKopi(nama, harga);
    }

    Get.back(); 
  }

  Future<void> tambahKopi(String nama, String harga) async {
    await _db.collection('kopi').add({'nama': nama, 'harga': int.parse(harga)});
  }

  Future<void> updateKopi(Kopi kopi) async {
    await _db.collection('kopi').doc(kopi.id).update({
      'nama': kopi.nama,
      'harga': kopi.harga,
    });
  }

  Future<void> hapusKopi(String id) async {
    await _db.collection('kopi').doc(id).delete();
  }

  Future<void> ambilKopi() async {
    _db.collection('kopi').snapshots().listen((snapshot) {
      kopis.value = snapshot.docs
          .map((doc) => Kopi.fromJson(doc.data(), doc.id))
          .toList();
    });
  }
}
