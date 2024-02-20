import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        leadingWidth: Get.currentRoute == '/home' ? 0 : kToolbarHeight, 
        leading: Get.currentRoute == '/home' ? null : IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20), // Menambahkan jarak 20 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              child: Text("Pindah ke profil"),
            ),
            SizedBox(height: 10), // Menambahkan jarak 10 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/counter');
              },
              child: Text("Pindah halaman Counter"),
            ),
            SizedBox(height: 10), // Menambahkan jarak 10 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/tugas');
              },
              child: Text("Halaman Tugas"),
            ),
            SizedBox(height: 10), // Menambahkan jarak 10 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/tugasdua');
              },
              child: Text("Halaman Tugasdua"),
            ),
            SizedBox(height: 10), // Menambahkan jarak 10 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/biodata');
              },
              child: Text("Halaman Biodata"),
            ),
            SizedBox(height: 10), // Menambahkan jarak 10 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/form');
              },
              child: Text("Halaman Form"),
            ),
          ],
        ),
      ),
    );
  }
}
