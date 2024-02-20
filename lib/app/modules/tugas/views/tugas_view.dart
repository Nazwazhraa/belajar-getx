import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tugas_controller.dart';

class TugasView extends GetView<TugasController> {
  const TugasView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TugasView'), // Mengganti judul AppBar sesuai dengan nama kelas
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                return Text(
                  "${controller.count.value}", // Mengakses nilai count dari controller
                  style: TextStyle(fontSize: controller.countSize.value.toDouble()), // Mengakses nilai countSize dari controller
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16, // Jarak dari bawah layar
            right: 16, // Jarak dari kanan layar
            child: FloatingActionButton(
              onPressed: () {
                controller.decrement();
              },
              child: Icon(Icons.remove),
            ),
          ),
          Positioned(
            bottom: 16, // Jarak dari bawah layar
            right: 80, // Jarak dari kanan layar
            child: FloatingActionButton(
              onPressed: () {
                controller.increment();
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
