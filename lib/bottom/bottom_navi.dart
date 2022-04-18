import 'package:baca_buku_flutter/bottom/akun.dart';
import 'package:flutter/material.dart';
import 'package:baca_buku_flutter/bottom/one.dart';
import 'package:baca_buku_flutter/bottom/two.dart';
import 'package:baca_buku_flutter/bottom/three.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({Key? key}) : super(key: key);

  @override
  _BottomNaviState createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int currentIndex = 0;
  final List<Widget> body = [
    const One(),
    const Two(),
    const Three(),
    const Akun(),
  ];

  void ontap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
            activeIcon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Telusuri',
            activeIcon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create_outlined),
            label: 'Tulis',
            activeIcon: Icon(
              Icons.create,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
            activeIcon: Icon(
              Icons.person,
            ),
          ),
        ],
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
      ),
    );
  }
}
