import 'package:flutter/material.dart';

import '../models/UsersModel.dart';

Widget UserDetailLoadingUI() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget UserDetailLoadedUI(BuildContext context, List<UsersModel> list) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return SizedBox(
        height: height * 0.4,
        width: width * 0.4,
        child: Column(
          children: [
            Text(list[index].name.toString()),
            Text(list[index].address!.street.toString() +
                list[index].address!.city.toString())
          ],
        ),
      );
    },
  );
}

Widget UserDetailErrorUI(String text) {
  return Container(
    color: Colors.red,
    child: Center(
      child: Text(text),
    ),
  );
}
