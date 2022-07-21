import 'package:flutter/material.dart';

import '../models/PhotosModel.dart';

Widget PhotosLoadingUI() {
  return CircularProgressIndicator();
}

Widget PhotosLoadedUI(BuildContext context, List<PhotosModel> list) {
  double height = MediaQuery.of(context).size.height;
  return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Container(
          height: height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                list[index].thumbnailUrl.toString(),
              ),
            ),
          ),
        );
      });
}

Widget PhotosErrorUI(String msg) {
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
