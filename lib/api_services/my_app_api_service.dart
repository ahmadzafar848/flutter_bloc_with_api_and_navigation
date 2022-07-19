import 'dart:convert';

import 'package:bloc_api_implementation/models/PostsModel.dart';
import 'package:bloc_api_implementation/models/UsersModel.dart';
import 'package:http/http.dart';

class JsonApiServices {
  final String baseURL = 'https://jsonplaceholder.typicode.com/';
  final String usersApiURL = 'users/';

  final String postsApiURL = 'posts/';
  Future<List<UsersModel>> fetchUsers() async {
    Response response = await get(Uri.parse(baseURL + usersApiURL));

    List data = jsonDecode(response.body);
    return data.map((e) => UsersModel.fromJson(e)).toList();
  }

  Future<List<PostsModel>> fetchPosts(int id) async {
    Response response =
        await get(Uri.parse('$baseURL$usersApiURL$id/$postsApiURL'));
    List data = jsonDecode(response.body);
    return data.map((e) => PostsModel.fromJson(e)).toList();
  }
}
