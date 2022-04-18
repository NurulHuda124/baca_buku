// ignore_for_file: equal_keys_in_map

import 'package:baca_buku_flutter/bottom/bottom_navi.dart';
import 'package:baca_buku_flutter/bottom/one.dart';
import 'package:baca_buku_flutter/bottom/register.dart';
import 'package:baca_buku_flutter/login/login.dart';
import 'package:baca_buku_flutter/pages/bookmark.dart';
import 'package:baca_buku_flutter/pages/favorite.dart';
import 'package:baca_buku_flutter/pages/tulisku.dart';
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
      title: 'Baca Buku',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/one': (context) => const One(),
        '/one': (context) => const BottomNavi(),
        '/bookmark': (context) => const Bookmark(),
        '/favorit': (context) => const Favorite(),
        '/tulisku': (context) => const Tulisku(),
        '/daftar': (context) => const Register(),
      },
    );
  }
}
