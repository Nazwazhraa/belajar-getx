import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/categories_controller.dart';

class TambahCategoriesView extends StatelessWidget {
  final CategoriesController controller = Get.find<CategoriesController>();

  final TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Categories'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama Categories'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.addCategories(
                  nameController.text,
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
  
}