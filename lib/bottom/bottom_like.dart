import 'package:baca_buku_flutter/pages/bookmark.dart';
import 'package:baca_buku_flutter/pages/coment.dart';
import 'package:baca_buku_flutter/pages/favorite.dart';
import 'package:flutter/material.dart';

class BottomLike extends StatefulWidget {
  const BottomLike({Key? key}) : super(key: key);

  @override
  _BottomLikeState createState() => _BottomLikeState();
}

class _BottomLikeState extends State<BottomLike> {
  int currentIndex = 0;
  final List<Widget> body = [
    const Favorite(),
    const Coment(),
    const Bookmark(),
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
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorit',
            activeIcon: Icon(
              Icons.favorite,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: 'Koementar',
            activeIcon: Icon(
              Icons.comment,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Tulis',
            activeIcon: Icon(
              Icons.bookmark,
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
