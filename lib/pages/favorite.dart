import 'package:baca_buku_flutter/pages/dua.dart';
import 'package:baca_buku_flutter/pages/satu.dart';
import 'package:baca_buku_flutter/pages/tiga.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritku', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
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
          ],
        ),
      ),
    );
  }
}
