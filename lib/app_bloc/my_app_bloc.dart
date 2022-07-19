import 'package:bloc/bloc.dart';
import 'package:bloc_api_implementation/repos/my_app_repos.dart';
import 'package:meta/meta.dart';

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
  }
}
