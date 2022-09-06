import 'package:filmler_uygulamasi/anasayfa.dart';
import 'package:filmler_uygulamasi/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ).copyWith(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: anaRenk,
        )
      ),
      home: Anasayfa(),
    );
  }
}


