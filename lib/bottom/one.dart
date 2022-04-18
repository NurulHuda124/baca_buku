import 'package:baca_buku_flutter/pages/dua.dart';
import 'package:baca_buku_flutter/pages/satu.dart';
import 'package:baca_buku_flutter/pages/tiga.dart';
import 'package:flutter/material.dart';

class One extends StatelessWidget {
  const One({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Buku Terfavorit',
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Satu();
                    }));
                  },
                  child: const Image(
                    image: NetworkImage('assets/images/Teluk_Alaska.jpg'),
                    width: 150,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Dua();
                    }));
                  },
                  child: const Image(
                    image: NetworkImage('assets/images/antares2.jfif'),
                    width: 140,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Tiga();
                    }));
                  },
                  child: const Image(
                    image: NetworkImage('assets/images/abighea.jfif'),
                    width: 145,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Buku Lainnya',
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: NetworkImage('assets/images/elisa.jfif'),
                  width: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Image(
                  image: NetworkImage('assets/images/fake_smile.jfif'),
                  width: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Image(
                  image: NetworkImage('assets/images/aya.jpg'),
                  width: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Image(
                  image: NetworkImage('assets/images/santri.jpg'),
                  width: 110,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: NetworkImage('assets/images/sagara.jpg'),
                  width: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Image(
                  image: NetworkImage('assets/images/cha.jpg'),
                  width: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Image(
                  image: NetworkImage('assets/images/milan.jpg'),
                  width: 110,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Image(
                  image: NetworkImage('assets/images/saga.jpg'),
                  width: 110,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
