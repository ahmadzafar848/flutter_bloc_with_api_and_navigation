import 'package:bloc_api_implementation/app_bloc/my_app_bloc.dart';
import 'package:bloc_api_implementation/navigation/app_navigation_routing.dart';
import 'package:bloc_api_implementation/screens/home_page_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserAppBloc>(
          create: (context) => UserAppBloc(),
        ),
        BlocProvider<PostAppBloc>(
          create: (context) => PostAppBloc(),
        ),
        BlocProvider<CommentsAppBloc>(
          create: (context) => CommentsAppBloc(),
        ),
        BlocProvider<PhotosAppBloc>(
          create: (context) => PhotosAppBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: JsonAppNavigation.buildPage,
        home: UsersScreen(),
      ),
    );
  }
}
