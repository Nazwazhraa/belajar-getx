import 'package:get/get.dart';

import '../modules/biodata/bindings/biodata_binding.dart';
import '../modules/biodata/views/biodata_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/form/bindings/form_binding.dart';
import '../modules/form/views/form_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/tugas/bindings/tugas_binding.dart';
import '../modules/tugas/views/tugas_view.dart';
import '../modules/tugasdua/bindings/tugasdua_binding.dart';
import '../modules/tugasdua/views/tugasdua_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.TUGAS,
      page: () => const TugasView(),
      binding: TugasBinding(),
    ),
    GetPage(
      name: _Paths.TUGASDUA,
      page: () => const TugasduaView(),
      binding: TugasduaBinding(),
    ),
    GetPage(
      name: _Paths.BIODATA,
      page: () => BiodataView(),
      binding: BiodataBinding(),
    ),
    GetPage(
      name: _Paths.FORM,
      page: () => const FormView(),
      binding: FormBinding(),
    ),
  ];
}
