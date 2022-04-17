import 'package:flutter/material.dart';

import 'bottom/bottom_navi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baca Buku',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: const BottomNavi(),
    );
  }
}
