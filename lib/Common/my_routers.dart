import 'package:flutter/material.dart';

import '../main.dart';
import '../pages/loginpage.dart';
import '../pages/now_play_page.dart';
import '../pages/play_list_page.dart';

const String routeHome = "/home";
const String routeLogin = "/login";
const String routePlayList = "/play_list";
const String routNowPlay = "/now_play";

class MyRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case "/login":
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case "/play_list":
        return MaterialPageRoute(builder: (_) => const PlayListPage());
      case "/now_play":
        final Song song = settings.arguments as Song;
        return MaterialPageRoute(builder: (_) => NowPlayingPage(song: song));
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
