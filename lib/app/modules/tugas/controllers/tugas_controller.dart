import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TugasController extends GetxController {
  var count = 0.obs;
  var countSize = 25.obs;

  void increment() {
    if (count.value < 100) {
      count.value++;
      countSize.value += 2;
    } else {
      _showLimitAlert();
    }
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
      countSize.value -= 2;
    } else {
      _showLimitAlert();
    }
  }

void _showLimitAlert() {
  Get.snackbar(
    'Peringatan',
    'Maaf, sudah mencapai batas',
    backgroundColor: Colors.red,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP, 
    duration: const Duration(seconds: 5), 
  );
}
}
