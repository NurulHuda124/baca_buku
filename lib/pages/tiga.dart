import 'package:baca_buku_flutter/pages/bookmark.dart';
import 'package:baca_buku_flutter/pages/coment.dart';
import 'package:baca_buku_flutter/pages/favorite.dart';
import 'package:flutter/material.dart';

class Tiga extends StatelessWidget {
  const Tiga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            const Image(
              image: NetworkImage('assets/images/abi.jfif'),
              width: 500,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Favorite();
                    }));
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Coment();
                    }));
                  },
                  child: const Icon(
                    Icons.comment,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Bookmark();
                    }));
                  },
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Text('Prolog'),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Text('***'),
                Text(
                    'Sudah siap menjadi saksi hidup perjalanan Ares, Zea, dan Calderioz selanjutnya?'),
                Text('Jangan lupa vote, comment, share, dan mention'),
                Text('***'),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Text('SUARA binatang malam terdengar, bersahutan dengan'),
                Text(
                    'keras seakan tak membiarkan penghujung hari ini berakhir'),
                Text('sunyi nan sepi. Sinar rembulan yang semu diiringi '),
                Text('kencangnya embusan angin, tak membuat sosok yang '),
                Text('tengah berlari kedinginan sedikit pun.'),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Text('Pertarungan sengit antar dua kubu, rerumputan liar '),
                Text('hampir setinggi pinggang merambat ke sana-kemari, dan '),
                Text('semak belukar tak berujung adalah pemandangan yang'),
                Text('disuguhkan di tanah yang teramat luas ini.'),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                Text('Entah sudah ke berapa kalinya, sosok dengan rambut'),
                Text('keriting dan kulit kecokelatan, melayangkan pukulan '),
                Text('lawan di hadapannya. Sesekali irisnya bergerak liar'),
                Text('mengedarkan pandangan, mengamati teman-temannya'),
                Text('yang berpencar dan tak gencar menyerang musuh.'),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
