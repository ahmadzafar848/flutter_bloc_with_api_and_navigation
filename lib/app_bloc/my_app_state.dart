part of 'my_app_bloc.dart';

@immutable
abstract class MyAppState {}

class UsersInitialState extends MyAppState {
  final String msg;
  UsersInitialState({required this.msg});
}

class UserLoadingState extends MyAppState {}

class UsersLoadingState extends MyAppState {}

class UserLoadedState extends MyAppState {
  final int id;
  UserLoadedState({required this.id});
}

class UsersLoadedState extends MyAppState {
  final List<UsersModel> list;
  UsersLoadedState({required this.list});
}

class UserErrorState extends MyAppState {
  final String errorMessage;
  UserErrorState({required this.errorMessage});
}

class UsersPostLoadingState extends MyAppState {}

class UsersPostLoadedState extends MyAppState {
  final int id;
  UsersPostLoadedState({required this.id});
}

class UsersPostsLoadedState extends MyAppState {
  final List<PostsModel> list;
  UsersPostsLoadedState({required this.list});
}

class UserPostsErrorState extends MyAppState {
  final String postErrorMsg;
  UserPostsErrorState({required this.postErrorMsg});
}
