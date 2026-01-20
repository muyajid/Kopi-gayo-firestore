import 'package:flutter/material.dart';
import 'package:project_bebas_deh/models/kopi.model.dart';
import 'menu_card.dart';

class MenuLayoutLandscape extends StatelessWidget {
  final List<Kopi> kopis;

  const MenuLayoutLandscape({super.key, required this.kopis});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.6,
      ),
      itemCount: kopis.length,
      itemBuilder: (context, index) {
        return MenuCard(kopi: kopis[index]);
      },
    );
  }
}
