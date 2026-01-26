import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:project_bebas_deh/controllers/payment_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebview extends StatelessWidget {
  PaymentWebview({super.key});
  final PaymentController controller = Get.find<PaymentController>();

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran Kopi Gayo"),
        backgroundColor: Colors.brown,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller.webViewController),
          Obx(() => controller.isLoading.value 
            ? const Center(child: CircularProgressIndicator(color: Colors.brown)) 
            : const SizedBox.shrink()),
        ],
      ),
    );
  }
}