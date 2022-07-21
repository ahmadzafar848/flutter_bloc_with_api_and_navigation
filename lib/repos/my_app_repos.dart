import 'package:bloc_api_implementation/api_services/my_app_api_service.dart';
import 'package:bloc_api_implementation/models/CommentsModel.dart';
import 'package:bloc_api_implementation/models/PhotosModel.dart';
import 'package:bloc_api_implementation/models/UsersModel.dart';

import '../models/PostsModel.dart';

class JsonRepository {
  final userApiService = JsonApiServices();
  Future<List<UsersModel>> fetchUsersData() async {
    return await userApiService.fetchUsers();
  }

  Future<List<PostsModel>> fetchUsersPosts(int id) async {
    return await userApiService.fetchPosts(id);
  }

  Future<List<PhotosModel>> fetchUserPhotos(int id) async {
    return await userApiService.fetchPhotos(id);
  }

  Future<List<CommentsModel>> fetchUsersComments(int id) async {
    return await userApiService.fetchComments(id);
  }
}
