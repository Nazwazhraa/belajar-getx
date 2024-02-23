import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/categories_controller.dart';
import 'package:getx/app/data/models/categories_model.dart';

class ShowCategoriesView extends StatelessWidget {
  final CategoriesController controller = Get.find();
   final Categories categories;
 ShowCategoriesView({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Categories')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.categoriesList.length,
          itemBuilder: (context, index) {
            Categories categories = controller.categoriesList[index];
            return ListTile(
              title: Text(categories.name.toString()),
              subtitle: Text('Categories ID: ${categories.name}'),
              onTap: () => controller.showCategoriesDetails(categories),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/tambah categories');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}