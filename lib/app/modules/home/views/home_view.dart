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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
          
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/profile');
              },
              child: const Text("Pindah ke profil"),
            ),
           const SizedBox(height: 10), 
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/counter');
              }, 
              child: const Text("Pindah halaman Counter"),
            ),
            const SizedBox(height: 10), // Menambahkan jarak 10 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/tugas');
              },
              child: const Text("Halaman Tugas"),
            ),
            const SizedBox(height: 10), // Menambahkan jarak 10 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/tugasdua');
              },
              child: const Text("Halaman Tugasdua"),
            ),
            const SizedBox(height: 10), // Menambahkan jarak 10 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/biodata');
              },
              child: const Text("Halaman Biodata"),
            ),
            const SizedBox(height: 10), // Menambahkan jarak 10 pixel di antara tombol-tombol
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/form');
              },
              child: const Text("Halaman Form"),
            ),
            const SizedBox(height: 10), 
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/register');
              }, 
              child: const Text("Pindah halaman Register"),
            ),
            const SizedBox(height: 10), 
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
              }, 
              child: const Text("Pindah halaman Login"),
            ),
            const SizedBox(height: 10), 
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/categories');
              }, 
              child: const Text("Categories"),
            ),
          ],
        ),
      ),
    );
  }
}
