import 'package:bloc/bloc.dart';
import 'package:bloc_api_implementation/models/PhotosModel.dart';
import 'package:bloc_api_implementation/repos/my_app_repos.dart';
import 'package:meta/meta.dart';

import '../models/CommentsModel.dart';
import '../models/PostsModel.dart';
import '../models/UsersModel.dart';

part 'my_app_event.dart';
part 'my_app_state.dart';

final userRepository = JsonRepository();

class UserAppBloc extends Bloc<MyAppEvent, MyAppState> {
  UserAppBloc() : super(UsersLoadingState()) {
    on<FetchUsersEvent>((event, emit) async {
      try {
        List<UsersModel> list = await userRepository.fetchUsersData();
        emit.call(UsersLoadedState(list: list));
      } catch (e) {
        emit.call(UserErrorState(errorMessage: 'Catch Block$e'));
      }
    });
  }
}

class PostAppBloc extends Bloc<MyAppEvent, MyAppState> {
  PostAppBloc() : super(UsersPostLoadingState()) {
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
  }
}

class CommentsAppBloc extends Bloc<MyAppEvent, MyAppState> {
  CommentsAppBloc() : super(UserCommentsLoadingState()) {
    on<FetchUsersComments>((event, emit) async {
      try {
        int id = event.id;
        List<CommentsModel> list = await userRepository.fetchUsersComments(id);
        emit.call(UserCommentsLoadedState(list));
      } catch (e) {
        emit.call(UserPostsErrorState(
          postErrorMsg: e.toString(),
        ));
      }
    });
  }
}

class PhotosAppBloc extends Bloc<MyAppEvent, MyAppState> {
  PhotosAppBloc() : super(UserPhotosLoadingState()) {
    on<FetchUsersPhotos>((event, emit) async {
      try {
        int id = event.id;
        List<PhotosModel> list = await userRepository.fetchUserPhotos(id);
        emit.call(UserPhotosLoadedState(list));
      } catch (e) {
        emit.call(UserPostsErrorState(
          postErrorMsg: e.toString(),
        ));
      }
    });
  }
}

class UserDetailAppBloc extends Bloc<MyAppEvent, MyAppState> {
  UserDetailAppBloc() : super(UsersDetailLoadingState()) {
    on<FetchUsersDetailEvent>((event, emit) async {
      try {
        int id = event.id;
        List<UsersModel> list = await userRepository.fetchUsersDetailData(id);
        emit.call(UsersDetailLoadedState(list: list));
      } catch (e) {
        emit.call(UserDetailErrorState(errorMessage: e.toString()));
      }
    });
  }
}
