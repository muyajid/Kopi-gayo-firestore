import 'package:get/get.dart';
import 'package:project_bebas_deh/bindings/kopi.binding.dart';
import 'package:project_bebas_deh/pages/menu_page.dart';
import 'package:project_bebas_deh/pages/menu_form_page.dart';
import 'package:project_bebas_deh/controllers/kopi.controller.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.menuPage,
      page: () => MenuPage(),
      binding: KopiBinding()
    ),
    GetPage(
      name: AppRoutes.menuForm,
      page: () => MenuFormPage(),
      binding: KopiBinding()
    ),
  ];
}
