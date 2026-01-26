import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kopi.controller.dart';
import '../widgets/menu_card.dart';
import 'package:project_bebas_deh/routes/app_routes.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final KopiController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Kopi"),
        backgroundColor: Colors.brown,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
        onPressed: () {
          // CREATE
          Get.toNamed(AppRoutes.menuForm);
        },
      ),
      body: Obx(() {
        if (controller.kopis.isEmpty) {
          return const Center(child: Text("Data kopi kosong"));
        }
        if (orientation == Orientation.portrait) {
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.kopis.length,
            itemBuilder: (_, i) => MenuCard(kopi: controller.kopis[i]),
          );
        }
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.6,
          ),
          itemCount: controller.kopis.length,
          itemBuilder: (_, i) => MenuCard(kopi: controller.kopis[i]),
        );
      }),
    );
  }
}
