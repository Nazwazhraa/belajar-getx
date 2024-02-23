import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:getx/app/data/models/categories_model.dart';
import 'package:getx/app/providers/api.dart';
import 'package:getx/app/routes/app_pages.dart';
import 'package:getx/app/modules/categories/views/show_categories_view.dart';

class CategoriesController extends GetxController {
  var categoriesList = <Categories>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }


 Future<void> fetchData() async {
  try {
    var apiUrl = '${Api.baseUrl}/categories';
    var headers = await Api.getHeaders();

    var response = await http.get(
      Uri.parse(apiUrl),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['categories'];
      if (jsonResponse != null) {
        if (jsonResponse is List) {
          categoriesList.assignAll(jsonResponse.map((model) => Categories.fromJson(model)));
        } else {
          print('Response data is not a List');
        }
      } else {
        print('Response data is null');
      }
    } else {
      throw Exception('Failed to load categories');
    }
  } catch (e) {
    print('Error during fetching categories: $e');
  }
}


// tambah categories
Future<void> addCategories(String name) async {
    try {
      if (name.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/categories';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'Nama Categories': name,
        },
      );

      if (response.statusCode == 201) {
        Get.snackbar('Sukses', 'Categories berhasil ditambahkan');
        fetchData();
        Get.offAndToNamed(Routes.CATEGORIES);
      } else {
        throw Exception('Failed to add categories');
      }
    } catch (e) {
      print('Error during add mapel: $e');
    }
  }



// edit categories
  Future<void> editCategories(Categories categories, String name) async {
    try {
      if (name.isEmpty
      ) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/categories/${categories.id}';
      var headers = await Api.getHeaders();

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'nama categories': name,
        },
      );

      if (response.statusCode == 201) {
        Get.snackbar('Sukses', 'Categories berhasil diubah');
        fetchData();
        Get.offAndToNamed(Routes.CATEGORIES);
      } else {
        throw Exception('Failed to edit categories');
      }
    } catch (e) {
      print('Error during edit categories: $e');
    }
  }

void showCategoriesDetails(Categories categories) {
  Get.to(() => ShowCategoriesView(categories: categories));
}




 // delete categories
  Future<void> deleteCategories(Categories categories) async {
    try {
      var apiUrl = '${Api.baseUrl}/categories/${categories.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Categories berhasil dihapus');
          fetchData();
        
      } else {
        throw Exception('Failed to delete Categories');
      }
    } catch (e) {
      print('Error during delete Categories: $e');
    }
  }
}