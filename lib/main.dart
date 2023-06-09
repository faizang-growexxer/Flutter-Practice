import 'package:flutter/material.dart';
import 'package:flutter_practice/screens/SignUpScreen.dart';

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
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0XFF607D8B),
          primaryColorDark: const Color(0XFF455A64),
          primaryColorLight: const Color(0XFFCFD8DC),
          fontFamily: 'Georgia',
          appBarTheme: const AppBarTheme(
            color: Color(0XFF455A64),
          ),
          scaffoldBackgroundColor: const Color(0XFFCFD8DC),
          textTheme: const TextTheme(
              displayLarge:
                  TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
              bodyMedium: TextStyle(
                  fontSize: 14, fontFamily: 'Hind', color: Color(0XFF212121)))),
      home: const SignUpScreen(),
    );
  }
}
