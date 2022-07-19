import 'package:bloc_api_implementation/screens/home_page_user.dart';
import 'package:bloc_api_implementation/screens/user_post_screen.dart';
import 'package:flutter/material.dart';

class JsonAppNavigation {
  static Route? buildPage(RouteSettings settings) {
    String? name = settings.name;
    switch (name) {
      case UsersScreen.usersHomeScreen:
        {
          return MaterialPageRoute(
              builder: (context) {
                return UsersScreen();
              },
              settings: settings);
        }
      case UserPostScreen.usersPostScreen:
        {
          return MaterialPageRoute(
              builder: (context) {
                return UserPostScreen();
              },
              settings: settings);
        }
      default:
        {
          return MaterialPageRoute(
            builder: (context) {
              return Scaffold(
                body: Container(
                  color: Colors.red,
                  child: Center(
                    child: Text('No Such Screen'),
                  ),
                ),
              );
            },
          );
        }
    }
  }
}
