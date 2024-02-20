import 'package:get/get.dart';

import '../controllers/tugasdua_controller.dart';

class TugasduaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TugasduaController>(
      () => TugasduaController(),
    );
  }
}
