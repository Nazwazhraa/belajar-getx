import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../providers/api.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var user = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');

      if (token == null) {
        throw Exception('Token not found');
      }

      var headers = {'Authorization': 'Bearer $token'};

      var apiUrl = '/api/user';
      var response = await http.get(
        Uri.parse(Api.baseUrl + apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var apiResponse = json.decode(response.body);
        user.value = apiResponse;
      } else {
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      print('Error during fetching user details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');

      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}