import 'package:flutter/material.dart';

import '../models/CommentsModel.dart';

Widget CommentsLoadingUI() {
  return CircularProgressIndicator();
}

Widget CommentsLoadedUI(List<CommentsModel> list, BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return Center(
        child: SizedBox(
          height: height * 0.3,
          width: width,
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Text(''''PostId
${list[index].postId.toString()}'''),
                Text('''Comments 
${list[index].body.toString()}'''),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget CommentsErrorUI(String msg) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Center(
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text(msg),
            ),
          ),
        )
      ],
    ),
  );
}
