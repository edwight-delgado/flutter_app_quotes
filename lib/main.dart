import 'package:flutter/material.dart';
import 'package:quotes/homePage.dart';
import 'package:quotes/pages/list_quote.dart';
import './widgets/app_bar_widget.dart';
import './widgets/drawer_widget.dart';
import './widgets/bottomNavigationBarWidget.dart';
//import 'homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/ajedrez': (context) => ListQuote(param: 'ajedrez'),
          '/vida': (context) => ListQuote(param: 'vida'),
          '/educacion': (context) => ListQuote(param: 'educación'),
        },
        theme: ThemeData(
            //primarySwatch: Colors.blue,
            ),
        home: HomePage());
  }
}
