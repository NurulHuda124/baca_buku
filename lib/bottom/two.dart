import 'package:flutter/material.dart';

class Two extends StatelessWidget {
  const Two({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(),
                ),
                labelText: 'Cari Judul Buku...',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: NetworkImage('assets/images/Teluk_Alaska.jpg'),
                  width: 150,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                Image(
                  image: NetworkImage('assets/images/antares2.jfif'),
                  width: 140,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Image(
                  image: NetworkImage('assets/images/abighea.jfif'),
                  width: 145,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: NetworkImage('assets/images/aya.jpg'),
                  width: 150,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                Image(
                  image: NetworkImage('assets/images/elisa.jfif'),
                  width: 150,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Image(
                  image: NetworkImage('assets/images/fake_smile.jfif'),
                  width: 150,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: NetworkImage('assets/images/sagara.jpg'),
                  width: 150,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                Image(
                  image: NetworkImage('assets/images/santri.jpg'),
                  width: 150,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Image(
                  image: NetworkImage('assets/images/milan.jpg'),
                  width: 150,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
