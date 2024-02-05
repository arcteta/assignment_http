import 'dart:convert';

import 'package:assignment_http/models/post_model.dart';
import 'package:assignment_http/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> getUserData() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/'),
    );
    final list = json.decode(response.body) as List<dynamic>;
    return list.map((index) => UserModel.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load user data');
  }
}

Future<List<PostModel>> getPostData() async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
    );

    final list = json.decode(response.body) as List<dynamic>;
    return list.map((index) => PostModel.fromJson(index)).toList();
  } catch (error) {
    throw Exception('Failed to load post data');
  }
}
