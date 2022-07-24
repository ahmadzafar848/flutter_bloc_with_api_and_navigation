import 'package:bloc_api_implementation/screens/user_post_screen.dart';
import 'package:flutter/material.dart';

import '../models/UsersModel.dart';

Widget UsersLoadingUI() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget UsersLoadedUI(
  List<UsersModel> list,
) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(UserPostScreen.usersPostScreen,
                arguments: list[index]);
            // Navigator.pushNamed(context, UserPostScreen.usersPostScreen,
            //     arguments: list[index]);
          },
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  list[index].id.toString(),
                ),
              ),
              title: Center(child: Text(list[index].username.toString())),
            ),
          ),
        ),
      );
    },
  );
}

Widget UsersErrorUI(String message) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.red,
            child: Center(
              child: Text(message),
            ),
          ),
        )
      ],
    ),
  );
}
