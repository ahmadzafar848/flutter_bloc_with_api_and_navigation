import 'package:bloc_api_implementation/app_bloc/my_app_bloc.dart';
import 'package:bloc_api_implementation/models/UsersModel.dart';
import 'package:bloc_api_implementation/widgets/user_detail_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UserDetailScreen extends StatelessWidget {
  static const String userDetailScreen = '/user_detail';
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersModel usersModel =
        ModalRoute.of(context)!.settings.arguments as UsersModel;
    UserDetailAppBloc myBloc = Provider.of(context, listen: false);
    myBloc.add(FetchUsersDetailEvent(usersModel.id!));
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: BlocBuilder<UserDetailAppBloc, MyAppState>(
        builder: (context, state) {
          if (state is UsersDetailLoadingState) {
            return UserDetailLoadingUI();
          } else if (state is UsersDetailLoadedState) {
            return UserDetailLoadedUI(context, state.list);
          } else if (state is UserDetailErrorState) {
            return UserDetailErrorUI(state.errorMessage);
          } else {
            return Center(
              child: Text('User Detail Builder Error'),
            );
          }
        },
      ),
    );
  }
}
