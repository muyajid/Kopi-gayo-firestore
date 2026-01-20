import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../pages/payment_webview.dart'; 
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentController extends GetxController {
  final String serverKey = dotenv.env['MIDTRANS_SERVER_KEY'] ?? '';
  
  Future<void> buatPesanan(int harga, String namaKopi) async {
    try {
      String basicAuth = 'Basic ${base64Encode(utf8.encode('$serverKey:'))}';

      var response = await http.post(
        Uri.parse("https://app.sandbox.midtrans.com/snap/v1/transactions"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": basicAuth,
        },
        body: jsonEncode({
          "transaction_details": {
            "order_id": "GAYO-${DateTime.now().millisecondsSinceEpoch}",
            "gross_amount": harga
          },
          "item_details": [
            {
              "name": namaKopi,
              "price": harga,
              "quantity": 1
            }
          ],
        }),
      );

      if (response.statusCode == 201) {
        String redirectUrl = jsonDecode(response.body)['redirect_url'];
        Get.to(() => PaymentWebView(url: redirectUrl));
      } else {
        Get.snackbar("Gagal", "Error Midtrans: ${response.body}");
      }
    } catch (e) {
      Get.snackbar("Error", "Koneksi bermasalah: $e");
    }
  }
}