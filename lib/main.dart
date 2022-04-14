import 'package:flutter/material.dart';
import 'package:baca_buku_flutter/page/home_page.dart';
import 'package:baca_buku_flutter/page/item_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/item': (context) => const ItemPage(),
    },
  ));
}
