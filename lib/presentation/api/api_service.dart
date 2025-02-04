import 'dart:convert';
import 'dart:developer';
import 'package:chatpebble/presentation/api/user_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  static const String appUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<User>> fetchUser() async {
    final response = await dio.get(appUrl);
    log(response.toString(), name: "response");
    if (response.statusCode == 200) {
      List<dynamic> body = response.data;
      List<User> users = body.map((data) => User.fromJson(data)).toList();
      return users;
    } else {
      throw Exception("Failed to load User");
    }
  }
}
