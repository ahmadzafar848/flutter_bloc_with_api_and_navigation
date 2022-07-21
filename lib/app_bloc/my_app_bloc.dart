import 'package:bloc/bloc.dart';
import 'package:bloc_api_implementation/models/PhotosModel.dart';
import 'package:bloc_api_implementation/repos/my_app_repos.dart';
import 'package:meta/meta.dart';

import '../models/CommentsModel.dart';
import '../models/PostsModel.dart';
import '../models/UsersModel.dart';

part 'my_app_event.dart';
part 'my_app_state.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  final userRepository = JsonRepository();
  MyAppBloc() : super(UsersLoadingState()) {
    on<FetchUsersEvent>((event, emit) async {
      try {
        List<UsersModel> list = await userRepository.fetchUsersData();
        emit.call(UsersLoadedState(list: list));
      } catch (e) {
        emit.call(UserErrorState(errorMessage: 'Catch Block$e'));
      }
    });

    on<FetchUsersPosts>((event, emit) async {
      try {
        int id = event.id;
        emit.call(UsersPostLoadingState());
        List<PostsModel> list = await userRepository.fetchUsersPosts(id);
        emit.call(UsersPostsLoadedState(list: list));
      } catch (e) {
        emit.call(UserPostsErrorState(
          postErrorMsg: e.toString(),
        ));
      }
    });
    on<FetchUsersComments>((event, emit) async {
      try {
        int id = event.id;
        emit.call(UserCommentsLoadingState());
        List<CommentsModel> list = await userRepository.fetchUsersComments(id);
        print('sb gandu');
        emit.call(UserCommentsLoadedState(list));
      } catch (e) {
        emit.call(UserCommentsErrorState('Error State'));
      }
    });
    on<FetchUsersPhotos>((event, emit) async {
      int id = event.id;
      emit.call(UserPhotosLoadingState());
      try {
        List<PhotosModel> list = await userRepository.fetchUserPhotos(id);
        emit.call(UserPhotosLoadedState(list));
      } catch (e) {
        emit.call(UserPhotosErrorState('Photo Error State'));
      }
    });
  }
}
