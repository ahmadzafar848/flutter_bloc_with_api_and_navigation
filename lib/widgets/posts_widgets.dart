import 'package:bloc_api_implementation/screens/comments_screen.dart';
import 'package:bloc_api_implementation/screens/photos_screen.dart';
import 'package:flutter/material.dart';

import '../models/PostsModel.dart';

List<String> btnlist = ['Comments', 'Photos'];

Widget postsLoadingUI() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget postsLoadedUI(List<PostsModel> list, BuildContext context, int id) {
  double height = MediaQuery.of(context).size.height;
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, item_index) {
      return SizedBox(
        width: double.maxFinite,
        height: height * 0.4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CircleAvatar(
                        child: Text(
                          list[item_index].userId.toString(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        '''Title
                        
${list[item_index].title}''',
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Text(
                    '''Post
${list[item_index].body}''',
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      2,
                      (index) => ElevatedButton(
                        onPressed: () async {
                          if (index == 0) {
                            Navigator.pushNamed(
                                context, CommentsScreen.commentsScreen,
                                arguments: list[item_index]);
                          } else {
                            Navigator.pushNamed(
                                context, PhotosScreen.photoScreen,
                                arguments: list[item_index]);
                          }
                        },
                        child: Text(btnlist[index].toString()),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget postErrorUI(String text) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Center(
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text(text),
            ),
          ),
        )
      ],
    ),
  );
}
