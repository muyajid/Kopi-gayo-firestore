import 'package:flutter/material.dart';
import 'package:project_bebas_deh/models/kopi.model.dart';
import 'menu_layout_potrait.dart';
import 'menu_layout_landscape.dart';

class ResponsiveMenuLayout extends StatelessWidget {
  final List<Kopi> kopis;

  const ResponsiveMenuLayout({super.key, required this.kopis});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return MenuLayoutPortrait(kopis: kopis);
        } else {
          return MenuLayoutLandscape(kopis: kopis);
        }
      },
    );
  }
}
