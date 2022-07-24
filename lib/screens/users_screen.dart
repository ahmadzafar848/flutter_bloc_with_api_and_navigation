import 'package:bloc_api_implementation/app_bloc/my_app_bloc.dart';
import 'package:bloc_api_implementation/widgets/users_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);
  static const String usersHomeScreen = '/';

  @override
  Widget build(BuildContext context) {
    UserAppBloc myAppBloc = context.read<UserAppBloc>();
    myAppBloc.add(FetchUsersEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: BlocBuilder<UserAppBloc, MyAppState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return UsersLoadingUI();
          } else if (state is UsersLoadedState) {
            return UsersLoadedUI(state.list);
          } else if (state is UserErrorState) {
            return UsersErrorUI(state.errorMessage);
          } else {
            return Center(
              child: Text('User Builder Error'),
            );
          }
        },
      ),
    );
  }
}
