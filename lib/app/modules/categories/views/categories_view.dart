import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/categories_controller.dart';
import 'edit_categories_view.dart';
import 'package:getx/app/data/models/categories_model.dart';
import '../views/create_categories_view.dart';

class CategoriesView extends StatelessWidget {
  final CategoriesController controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(() => TambahCategoriesView());
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.categoriesList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.categoriesList.length,
                itemBuilder: (context, index) {
                  var categories = controller.categoriesList[index];
                  return ListTile(
                    title: Text('Nama Categories : ${categories.name}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Get.to(() => EditCategoriesView(categories: categories));
                          },
                        ),
                       IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDeleteConfirmation(context, categories);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            controller.showCategoriesDetails(categories);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }

void showDeleteConfirmation(BuildContext context, Categories categories) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Categories'),
        content: Text('Are you sure you want to delete ${categories.name}?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.deleteCategories(categories);
              Get.back();
            },
            child: Text('Delete'),
          ),
        ],
      );
    },
  );
}

}