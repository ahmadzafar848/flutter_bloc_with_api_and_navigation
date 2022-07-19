import 'package:bloc_api_implementation/app_bloc/my_app_bloc.dart';
import 'package:bloc_api_implementation/models/UsersModel.dart';
import 'package:bloc_api_implementation/widgets/posts_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UserPostScreen extends StatelessWidget {
  static const String usersPostScreen = '/posts';

  const UserPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersModel model = ModalRoute.of(context)!.settings.arguments as UsersModel;
    MyAppBloc bloc = Provider.of<MyAppBloc>(context, listen: false);
    bloc.add(FetchUsersPosts(model.id!));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          actions: [
            CircleAvatar(
              child: Text(
                model.id.toString(),
              ),
            ),
          ],
        ),
        body: BlocBuilder<MyAppBloc, MyAppState>(
            builder: (BuildContext context, state) {
          if (state is UsersPostLoadingState) {
            return postsLoadingUI();
          } else if (state is UsersPostsLoadedState) {
            return postsLoadedUI(state.list, context);
          } else if (state is UserPostsErrorState) {
            return postErrorUI(state.postErrorMsg);
          } else {
            return const Center(child: Text('Post Builder Error'));
          }
        }));
  }
}
