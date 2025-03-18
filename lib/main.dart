import 'package:flutter/material.dart';
import 'package:testeaz/ui/pages/episodes_page.dart';
import 'package:testeaz/ui/pages/home_page.dart';
import 'package:testeaz/util/theme.dart';
import 'package:testeaz/util/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Roboto", "Bebas Neue");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      theme:  theme.light(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context)=> const HomePage(),
        '/episodes' : (context)=> const EpisodesPage()
      },
    );
  }
}
