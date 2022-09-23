/*
 * API service for connecting to the API
 */

import 'package:dio/dio.dart';

class ApiService {
  var dio = Dio(BaseOptions(
    baseUrl: "https://ig-food-menus.herokuapp.com",
    connectTimeout: 10000,
    receiveTimeout: 10000,
    headers: {'Contnent-type': 'application/json'},
  ));

  Future<List<Map<String, dynamic>>> getFoodItems() async {
    try {
      final result = await dio.get('/burgers');
      return (result.data as List).cast<Map<String, dynamic>>();
    } catch (e) {
      return [];
    }
  }
}
