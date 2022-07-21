import 'package:bloc_api_implementation/app_bloc/my_app_bloc.dart';
import 'package:bloc_api_implementation/widgets/users_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);
  static const String usersHomeScreen = '/';

  @override
  Widget build(BuildContext context) {
    MyAppBloc myAppBloc = context.read<MyAppBloc>();
    myAppBloc.add(FetchUsersEvent());
    return Scaffold(
      body: BlocBuilder<MyAppBloc, MyAppState>(
        builder: (BuildContext context, state) {
          if (state is UsersLoadingState) {
            return UsersLoadingUI();
          } else if (state is UsersLoadedState) {
            return RefreshIndicator(onRefresh: ()async{
              myAppBloc.add(FetchUsersEvent());
            },
              child: UsersLoadedUI(
                state.list,
              ),
            );
          } else if (state is UserErrorState) {
            return RefreshIndicator(onRefresh: ()async{
              myAppBloc.add(FetchUsersEvent());
            },child: UsersErrorUI(state.errorMessage));
          } else {
            return const Center(
              child: Text('State Error'),
            );
          }
        },
      ),
    );
  }
}
