import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_bebas_deh/models/kopi.model.dart';
import 'menu_card.dart';

class MenuLayoutPortrait extends StatelessWidget {
  final List<Kopi> kopis;

  const MenuLayoutPortrait({super.key, required this.kopis});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: kopis.length,
      itemBuilder: (context, index) {
        return MenuCard(kopi: kopis[index]);
      },
    );
  }
}
