part of 'my_app_bloc.dart';

@immutable
abstract class MyAppEvent {}

class FetchUserEvent extends MyAppEvent {}

class FetchUsersEvent extends MyAppEvent {}

class FetchUserPost extends MyAppEvent {}

class FetchUsersPosts extends MyAppEvent {
  int id;
  FetchUsersPosts(this.id);
}
