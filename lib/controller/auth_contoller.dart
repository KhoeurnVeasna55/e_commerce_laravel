import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:online_mart/core/services/api_service.dart';
import 'package:online_mart/core/services/auth_service.dart';
import 'package:online_mart/models/user_model.dart';

class AuthController extends GetxController{
  final RxList<UserModel> userModelList = <UserModel>[].obs;
  final isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  late final ApiService _apiService;

  @override
  void onInit() {
    super.onInit();

    final baseUrl = dotenv.env['API_URL'] ?? "https://fallback-api.com/api/";

    if (dotenv.env['API_URL'] == null) {
      errorMessage.value = "API Base URL is not configured!";
      isLoading.value = false;
      log("Error: API_URL is missing in .env file.");
      return;
    }

    _apiService = ApiService(baseUrl: baseUrl);
  }

  Future<bool> isLogin(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final Map<String, dynamic> loginRequestBody = {
        'email': email,
        'password': password,
      };

      final response = await _apiService.callApi<Map<String, dynamic>>(
        endpoint: 'login',
        method: 'POST',
        body: loginRequestBody,
        fromJson: (json) => json,
      );
      if (response.containsKey('token')) {
        await AuthService().saveToken(response['token']);
      }
      
      log("Login success: $response");

      if (response.containsKey("user")) {
        final user = UserModel.fromJson(response['user']);
        userModelList.assignAll([user]);
      }

      isLoading.value = false;
      return true;
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'An error occurred during login';
      log('Login error: $e');
      return false;
    }
  }
  Future<bool> isRegister(String name, String email, String password, confirm) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final Map<String, dynamic> registerRequestBody = {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirm,
      };

      final response = await _apiService.callApi<Map<String, dynamic>>(
        endpoint: 'register',
        method: 'POST',
        body: registerRequestBody,
        fromJson: (json) => json,
      );

      if (response.containsKey('token')) {
        await AuthService().saveToken(response['token']);
      }
      log("Register success: $response");

      if (response.containsKey("user")) {
        final user = UserModel.fromJson(response['user']);
        userModelList.assignAll([user]);
      }

      isLoading.value = false;
      return true;
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'An error occurred during registration'  ;
      log('Registration error: $e');
      return false;
    }
}
}