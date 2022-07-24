part of 'my_app_bloc.dart';

@immutable
abstract class MyAppEvent {}

class FetchUsersEvent extends MyAppEvent {}

class FetchUsersDetailEvent extends MyAppEvent {
  int id;
  FetchUsersDetailEvent(this.id);
}

class FetchUsersPosts extends MyAppEvent {
  int id;
  FetchUsersPosts(this.id);
}

class FetchUsersComments extends MyAppEvent {
  int id;
  FetchUsersComments(this.id);
}

class FetchUsersPhotos extends MyAppEvent {
  int id;
  FetchUsersPhotos(this.id);
}
