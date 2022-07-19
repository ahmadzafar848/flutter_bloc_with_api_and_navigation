import 'package:flutter/material.dart';

import '../models/PostsModel.dart';

Widget postsLoadingUI() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget postsLoadedUI(List<PostsModel> list, BuildContext context) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return SizedBox(
        width: double.maxFinite,
        height: 100,
        child: Card(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      child: Text(
                        list[index].userId.toString(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      list[index].title.toString(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  list[index].body.toString(),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget postErrorUI(String text) {
  return Container(
    color: Colors.red,
    child: Center(
      child: Text(text),
    ),
  );
}
