import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/categories_controller.dart';
import 'package:getx/app/data/models/categories_model.dart';

class EditCategoriesView extends StatelessWidget {
  final CategoriesController controller = Get.find();
  final Categories categories;

  
  final TextEditingController nameController = TextEditingController();

  EditCategoriesView({required this.categories}) {
  nameController.text = categories.name!;
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = categories.name.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Categories')),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                controller.editCategories(
                  categories,
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