import 'package:bloc_api_implementation/app_bloc/my_app_bloc.dart';
import 'package:bloc_api_implementation/models/PostsModel.dart';
import 'package:bloc_api_implementation/widgets/comments_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatelessWidget {
  static const String commentsScreen = '/comments';
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostsModel model = ModalRoute.of(context)!.settings.arguments as PostsModel;
    final myBloc = Provider.of<MyAppBloc>(context, listen: false);
    myBloc.add(FetchUsersComments(model.id!));
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: BlocBuilder<MyAppBloc, MyAppState>(
        builder: (context, state) {
          if (state is UserCommentsLoadingState) {
            return CommentsLoadingUI();
          } else if (state is UserCommentsLoadedState) {
            return RefreshIndicator(onRefresh: ()async{
              myBloc.add(FetchUsersComments(model.id!));
            },child: CommentsLoadedUI(state.list, context));
          } else if (state is UserCommentsErrorState) {
            return RefreshIndicator(onRefresh: ()async{
              myBloc.add(FetchUsersComments(model.id!));
            },child: CommentsErrorUI(state.msg));
          } else {
            return Text('Builder Error');
          }
        },
      ),
    );
  }
}
