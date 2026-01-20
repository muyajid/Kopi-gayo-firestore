import 'package:get/instance_manager.dart';
import 'package:project_bebas_deh/controllers/kopi.controller.dart';

class KopiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KopiController>(() => KopiController());
  }
}
