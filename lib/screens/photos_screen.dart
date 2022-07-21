import 'package:bloc_api_implementation/app_bloc/my_app_bloc.dart';
import 'package:bloc_api_implementation/models/PostsModel.dart';
import 'package:bloc_api_implementation/widgets/photos_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosScreen extends StatelessWidget {
  static const String photoScreen = '/photos';

  const PhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostsModel model = ModalRoute.of(context)!.settings.arguments as PostsModel;
    MyAppBloc bloc = context.read<MyAppBloc>();
    bloc.add(FetchUsersPhotos(model.id!));

    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: BlocBuilder<MyAppBloc, MyAppState>(
        builder: (context, state) {
          if (state is UserPhotosLoadingState) {
            return PhotosLoadingUI();
          } else if (state is UserPhotosLoadedState) {
            return RefreshIndicator(onRefresh: () async{
              bloc.add(FetchUsersPhotos(model.id!));
            },
            child: PhotosLoadedUI(context, state.list));
          } else if (state is UserPhotosErrorState) {
            return RefreshIndicator(onRefresh: ()async{
              bloc.add(FetchUsersPhotos(model.id!));
            },child: RefreshIndicator(onRefresh: ()async{
              bloc.add(FetchUsersPhotos(model.id!));
            },child: PhotosErrorUI(state.msg)));
          } else {
            return Text('Photo builder Error');
          }
        },
      ),
    );
  }
}
