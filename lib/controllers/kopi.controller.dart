import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project_bebas_deh/models/kopi.model.dart';

class KopiController extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var kopis = <Kopi>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ambilKopi();
  }

  Future<void> tambahKopi(String nama, String deskripsi) async {
    await _db.collection('kopi').add({'nama': nama, 'deskripsi': deskripsi});
  }

  Future<void> updateKopi(Kopi kopi) async {
    await _db.collection('kopi').doc(kopi.id).update({
      'nama': kopi.nama,
      'deskripsi': kopi.deskripsi,
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
