import 'dart:convert';

import 'package:bloc_api_implementation/models/CommentsModel.dart';
import 'package:bloc_api_implementation/models/PhotosModel.dart';
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

  Future<List<PhotosModel>> fetchPhotos(int id) async {
    final String apiforurl = 'posts';
    final String photoApiUrl = '$baseURL$apiforurl/$id/photos';
    Response response = await get(Uri.parse(photoApiUrl));
    List data = jsonDecode(response.body);
    return data.map((e) => PhotosModel.fromJson(e)).toList();
  }

  Future<List<CommentsModel>> fetchComments(int id) async {
    final String apiforurl = 'posts';
    final String commentsApiUrl = '$baseURL$apiforurl/$id/comments';
    Response response = await get(Uri.parse(commentsApiUrl));
    List data = jsonDecode(response.body);
    return data.map((e) => CommentsModel.fromJson(e)).toList();
  }
}
