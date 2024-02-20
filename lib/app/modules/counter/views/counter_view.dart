import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/home', preventDuplicates: true);
          },
        ),
     ),
      body: Center(
        child: Column(
          children: [
            Obx(
              () {
                return Text(
              "${controller.count}",
              style: TextStyle(fontSize: 20),
            );
           },
           ),
        Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                controller.increment();
              },
              child: Icon(Icons.add), 
              )
          ],
        )
          ],
    )
  ),
);
}
}