import 'package:covid_19_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App COVID-19',
      theme: ThemeData(
        fontFamily: 'NotoSerif',
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.transparent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
